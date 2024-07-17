<%@page language="java" contentType="text/html; charSet=UTF-8"  %>
>
<head>
    <!-- 设置视口以确保在各种设备上正确显示 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern WYSIWYG Editor</title>
    <style>
        /* 工具栏样式 */
        .editor-toolbar {
            margin-bottom: 10px; /* 工具栏与编辑器之间的间距 */
        }

        /* 工具栏按钮样式 */
        .editor-toolbar button {
            margin-right: 5px; /* 按钮之间的间距 */
        }

        /* 编辑器样式 */
        #editor {
            border: 1px solid #ccc; /* 编辑器的边框 */
            padding: 10px; /* 编辑器内部的填充 */
            min-height: 300px; /* 编辑器的最小高度 */
        }
    </style>
</head>
<body>
<!-- 工具栏，包含各种格式化按钮 -->
<div class="editor-toolbar">
    <!-- 加粗按钮 -->
    <button onclick="execCommand('bold')">Bold</button>
    <!-- 斜体按钮 -->
    <button onclick="execCommand('italic')">Italic</button>
    <!-- 下划线按钮 -->
    <button onclick="execCommand('underline')">Underline</button>
    <!-- 插入链接按钮 -->
    <button onclick="createLink()">Link</button>
    <!-- 插入图片按钮 -->
    <button onclick="insertImage()">Image</button>
</div>
<!-- 可编辑的div，用于实现WYSIWYG编辑器 -->
<div id="editor" contenteditable="true">
    This is a simple WYSIWYG editor.
</div>

<script>
    // 执行文档命令函数
    function execCommand(command) {
        document.execCommand(command, false, null); // 执行指定的文档命令
    }

    // 创建链接函数
    function createLink() {
        const url = prompt('Enter the link URL:', 'http://'); // 提示用户输入链接URL
        if (url) { // 如果用户输入了URL
            const selection = window.getSelection(); // 获取当前选择区域
            if (selection.rangeCount) { // 如果选择区域存在
                const range = selection.getRangeAt(0); // 获取第一个选择范围
                const anchor = document.createElement('a'); // 创建一个a元素
                anchor.href = url; // 设置a元素的href属性为用户输入的URL
                range.surroundContents(anchor); // 用a元素包围选中的内容
            }
        }
    }

    // 插入图片函数
    function insertImage() {
        const url = prompt('Enter the image URL:', 'http://'); // 提示用户输入图片URL
        if (url) { // 如果用户输入了URL
            const selection = window.getSelection(); // 获取当前选择区域
            if (selection.rangeCount) { // 如果选择区域存在
                const range = selection.getRangeAt(0); // 获取第一个选择范围
                const img = document.createElement('img'); // 创建一个img元素
                img.src = url; // 设置img元素的src属性为用户输入的URL
                range.insertNode(img); // 在选择范围插入img元素
            }
        }
    }
</script>
</body>
</html>