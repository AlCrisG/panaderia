<?php
    session_start();
    // Verifica que el usuario esté autenticado
    if (!isset($_SESSION['Nombre']) || !isset($_SESSION['Apellidos'])) {
        header("Location: index.php");
        exit();
    }

    include_once 'conn.php';

    // Verifica que se haya recibido el ID del producto por GET
    if (isset($_GET['id'])) {
        $id_producto = intval($_GET['id']);

        $sql = "SELECT COUNT(*) FROM loteproducción WHERE ID_Producto = '$id'";
        $resultado = mysqli_query($conn, $sql);

        if($resultado != 0) {
            $_SESSION['mensaje'] = "Las recetas ya producidas solo se pueden modificar.";

            header("Location: recetas.php");
            exit();
        }

        // Elimina todas las filas de receta asociadas al producto
        $sql = "DELETE FROM receta WHERE ID_Producto = $id_producto";
        if (mysqli_query($conn, $sql)) {
            $_SESSION['mensaje'] = "Receta eliminada correctamente.";
        } else {
            $_SESSION['mensaje'] = "Error al eliminar la receta.";
        }
        // Redirige a la página de recetas
        header("Location: recetas.php");
        exit();
    } else {
        // Si no se especificó el ID, muestra mensaje de error y redirige
        $_SESSION['mensaje'] = "ID de producto no especificado.";
        header("Location: recetas.php");
        exit();
    }
?>