# Feedback Page
### HTML - Code 
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contacts</title>
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="contact-animation">
        <canvas id="canvas"></canvas>
    </div>
    <div class="contact-card">
        <div class="contact-section">
            <div class="contact-content">
                <div class="header">
                    <h1>FeedBack</h1>
                    <form action="/submit_form" method="post">
                        <label for="name">Your Name:</label>
                        <input type="text" id="name" name="name" required>
            
                        <label for="email">Your email:</label>
                        <input type="email" id="email" name="email" required>
            
                        <label for="message">Your message:</label>
                        <textarea id="message" name="message" rows="5" required></textarea>
            
                        <button type="submit">Send</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="footer"></div>
</body>
</html>
```
### CSS - Style 
```css
body {
    line-height: 1.6; 
    margin: 0; 
}

.contact-animation {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 0;
    pointer-events: none;
}

.contact-card {
    position: relative;
    z-index: 1;
    /* max-width: 1200px; */
    margin: 0 auto;
    padding: 0 2rem;
}

.contact-section {
    position: relative;
    margin: 6rem auto 2rem;
    margin-bottom: 10rem;
    overflow: hidden;
}

.contact-content {
    position: relative;
    max-width: 800px;
    margin: 0 auto;
    padding: 2rem;
    margin-bottom: 2rem;
    background: #141414;
    border-radius: 25px;
    display: flex;
    flex-direction: column;
    box-shadow: 0 10px 20px rgba(0, 255, 255, 0.1);
}

[data-theme="light"] .contact-content {
    background: #C0C0C0;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333333;
}

form label {
    display: block;
    margin: 15px 0 5px;
    color: #555555;
}

form input,
form textarea {
    /* width: 160%; */
    width: 90%;
    padding: 20px;
    margin-bottom: 15px;
    border: 1px solid #cccccc;
    border-radius: 25px;
    box-sizing: border-box;
}

form button {
    display: block;
    width: 20%;
    padding: 10px;
    background-color: #007bff;
    color: #ffffff;
    border: none;
    border-radius: 25px;
    cursor: pointer;
}

form button:hover {
    background-color: #0056b3;
}
```