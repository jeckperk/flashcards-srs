function addCard() {
  const frontInput = document.getElementById('frontInput');
  const backInput = document.getElementById('backInput');
  const frontText = frontInput.value.trim();
  const backText = backInput.value.trim();

  // Валидация
  if (frontText === '' || backText === '') {
    alert('Заполните обе стороны карточки!');
    return;
  }

  const cardList = document.getElementById('cardList');
  const li = document.createElement('li');
  li.innerHTML = `
    <div class="card-content">
      <strong>${frontText}</strong>
      <span>${backText}</span>
    </div>
    <button onclick="this.parentElement.remove()">Удалить</button>
  `;
  cardList.appendChild(li);

  // Очищаем поля
  frontInput.value = '';
  backInput.value = '';
  frontInput.focus();
}
