# ✍️ Author Section and Style
### HTML - code
```html
<div class="author-section">
    <img src="path/your/image" alt="Author">
    <div>
        <h3>Author Name</h3>
        <p>Description</p>
    </div>
</div>
```
### CSS - style 
```css
.author-section {
    display: flex;
    align-items: center;
    gap: 1.5rem;
    padding: 1.5rem;
    background: #191919;
    border-radius: 25px;
    margin: 2rem 0;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}
.author-section img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    border: 2px solid var(--dark-theme-color); /* aad your color*/
}
.author-section h3 {
    color: #C0C0C0;
    font-weight: bold;
    margin-bottom: 0.5rem;
}
.author-section p {
    color: #808080;
    font-size: 0.9rem;
}
/* Theme */
[data-theme='light'] .author-section {
    background: #d0d0d0;
}
[data-theme='light'] .author-section img {
    border: 2px solid var(--light-theme-color); /* aad your color*/
}
[data-theme='light'] .author-section h3 {
    color: var(--light-theme-color); /* aad your color*/
}
```