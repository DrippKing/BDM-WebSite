document.addEventListener("DOMContentLoaded", function() {
    // Interactividad global para detalles: Me gusta y Comentarios (cliente-only, persistencia local)

    // Nota: el manejo del botón "Me gusta" se realiza mediante manejo delegado más abajo.

    // --- Comentarios: toggle de sección, publicar y persistir en localStorage ---
    function storageKeyForPost(postId) {
        return 'bdm_comments_post_' + postId;
    }

    function formatCommentTime(rawTime) {
        // Si rawTime parece ISO, parsear y formatear según la configuración del navegador
        if (typeof rawTime === 'string' && /^\d{4}-\d{2}-\d{2}T/.test(rawTime)) {
            try {
                const d = new Date(rawTime);
                return d.toLocaleString(undefined, { year: 'numeric', month: 'short', day: '2-digit', hour: '2-digit', minute: '2-digit' });
            } catch (e) {
                return rawTime;
            }
        }
        // Si no es ISO, asumimos que ya está formateado (compatibilidad con comentarios antiguos)
        return rawTime;
    }

    function renderCommentsList(container, comments) {
        container.innerHTML = '';
        comments.forEach(c => {
            const el = document.createElement('div');
            el.className = 'comment';
            const timeDisplay = formatCommentTime(c.time);
            el.innerHTML = `
                <div class="comment-meta"><strong>${escapeHtml(c.author)}</strong> · <small>${escapeHtml(timeDisplay)}</small></div>
                <div class="comment-text">${escapeHtml(c.text)}</div>
            `;
            container.appendChild(el);
        });
    }

    function escapeHtml(str) {
        if (!str) return '';
        return String(str)
            .replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&#039;');
    }

    // Cargar comentarios guardados para cada post existente en la página
    document.querySelectorAll('.post-card').forEach(card => {
        const postId = card.querySelector('.comment-btn')?.dataset.postId;
        if (!postId) return;
        const commentsSection = document.getElementById('comments-' + postId);
        if (!commentsSection) return;
        const existingContainer = commentsSection.querySelector('.existing-comments');
        if (!existingContainer) return;
        const raw = localStorage.getItem(storageKeyForPost(postId));
        let arr = [];
        try { arr = raw ? JSON.parse(raw) : []; } catch(e) { arr = []; }
        renderCommentsList(existingContainer, arr);
        // Keep comments-section hidden until user opens it (default)
    });

    // Delegated click for comment toggle and publish
    document.addEventListener('click', function(e) {
        // Manejo delegado para 'Me gusta' — funciona aún si hay listeners duplicados
        const likeDelegated = e.target.closest('.like-btn');
        if (likeDelegated) {
            likeDelegated.classList.toggle('liked');
            if (likeDelegated.classList.contains('liked')) {
                likeDelegated.innerHTML = '♥ Me gusta';
            } else {
                likeDelegated.innerHTML = '♡ Me gusta';
            }
            return;
        }
        const toggle = e.target.closest('.comment-btn');
        if (toggle) {
            const postId = toggle.dataset.postId;
            const commentsSection = document.getElementById('comments-' + postId);
            if (!commentsSection) return;
            // Toggle display
            if (commentsSection.style.display === 'none' || !commentsSection.style.display) {
                commentsSection.style.display = 'block';
                // focus input
                const input = commentsSection.querySelector('.comment-input');
                if (input) input.focus();
            } else {
                commentsSection.style.display = 'none';
            }
            return;
        }

        const publish = e.target.closest('.publish-comment-btn');
        if (publish) {
            const postId = publish.dataset.postId;
            const commentsSection = document.getElementById('comments-' + postId);
            if (!commentsSection) return;
            const input = commentsSection.querySelector('.comment-input');
            const existingContainer = commentsSection.querySelector('.existing-comments');
            if (!input || !existingContainer) return;
            const text = input.value.trim();
            if (!text) {
                // opción mínima: no publicar comentarios vacíos
                input.focus();
                return;
            }
            // Crear objeto comentario
            // Guardamos timestamps en formato ISO (UTC-preserving en el cliente) para formatear luego
            const now = new Date();
            const timeIso = now.toISOString();
            const commentObj = {
                author: typeof currentUsername !== 'undefined' && currentUsername ? currentUsername : 'Tú',
                time: timeIso,
                text: text
            };

            // Añadir a localStorage
            const key = storageKeyForPost(postId);
            let arr = [];
            try { arr = JSON.parse(localStorage.getItem(key)) || []; } catch(e) { arr = []; }
            arr.push(commentObj);
            try { localStorage.setItem(key, JSON.stringify(arr)); } catch(e) { console.warn('No se pudo guardar comentario en localStorage', e); }

            // Renderizar
            renderCommentsList(existingContainer, arr);

            // limpiar input y mantener foco para añadir más
            input.value = '';
            input.focus();
            return;
        }
    });

    // Convertir y mostrar fechas de publicaciones (data-upload-utc) a la zona local del navegador
    (function localizePostDates() {
        const nodes = document.querySelectorAll('.post-date[data-upload-utc]');
        if (!nodes || nodes.length === 0) return;
        nodes.forEach(n => {
            const iso = n.getAttribute('data-upload-utc');
            if (!iso) return;
            try {
                const d = new Date(iso);
                if (isNaN(d.getTime())) return;
                const formatted = d.toLocaleString(undefined, { year: 'numeric', month: 'short', day: '2-digit', hour: '2-digit', minute: '2-digit' });
                n.textContent = formatted;
            } catch (e) {
                // Leave fallback text if parsing fails
            }
        });
    })();
});