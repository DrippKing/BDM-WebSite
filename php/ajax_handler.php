<?php
session_start();
require_once 'db_connect.php';

header('Content-Type: application/json');

$response = ['success' => false, 'message' => 'Acción no válida.'];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
    
    // --- Acción para añadir un comentario ---
    if ($_POST['action'] === 'add_comment') {
        // 1. Validar que el usuario esté logueado
        if (!isset($_SESSION['user_id'])) {
            $response['message'] = 'Debes iniciar sesión para comentar.';
            echo json_encode($response);
            exit;
        }

        // 2. Validar datos recibidos
        $postId = filter_input(INPUT_POST, 'post_id', FILTER_VALIDATE_INT);
        $commentText = trim($_POST['comment_text'] ?? '');

        if (!$postId || empty($commentText)) {
            $response['message'] = 'Datos inválidos. El comentario no puede estar vacío.';
            echo json_encode($response);
            exit;
        }

        // 3. Insertar en la base de datos
        $userId = $_SESSION['user_id'];
        $uploadDate = date('Y-m-d H:i:s');
        $visibility = 1;

        $sql = "INSERT INTO comments (Comment_Body, Upload_Date, ID_Post_FK, ID_User_FK, Visibility_State) VALUES (?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssiii", $commentText, $uploadDate, $postId, $userId, $visibility);

        if ($stmt->execute()) {
            $response['success'] = true;
            $response['message'] = 'Comentario publicado.';
            // Devolvemos los datos del comentario para mostrarlo en la página
            $response['comment'] = [
                'username' => $_SESSION['username'],
                'profile_picture' => $_SESSION['profile_picture'] ?? 'default.jpg',
                'body' => htmlspecialchars($commentText),
                'date' => date('d M, Y H:i')
            ];
        } else {
            $response['message'] = 'Error al guardar el comentario: ' . $stmt->error;
        }
        $stmt->close();
    }
}

$conn->close();
echo json_encode($response);
?>