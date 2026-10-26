let cards = [];

function addCard() {
  const frontInput = document.getElementById('frontInput');
  const backInput = document.getElementById('backInput');
  const frontText = frontInput.value.trim();
  const backText = backInput.value.trim();

  if (frontText === '' || backText === '') {
    alert('Заполните обе стороны карточки!');
    return;
  }

  cards.push({ front: frontText, back: backText });
  renderCards();

  frontInput.value = '';
  backInput.value = '';
  frontInput.focus();
}

function renderCards() {
  const cardList = document.getElementById('cardList');
  cardList.innerHTML = '';
  cards.forEach((card, index) => {
    const li = document.createElement('li');
    li.innerHTML = `
      <div class="card-content">
        <strong>${card.front}</strong>
        <span>${card.back}</span>
      </div>
      <button onclick="deleteCard(${index})">Удалить</button>
    `;
    cardList.appendChild(li);
  });
}

function deleteCard(index) {
  cards.splice(index, 1);
  renderCards();
}

// При загрузке страницы отрисовать карточки (если есть)
document.addEventListener('DOMContentLoaded', renderCards);
