<!DOCTYPE html>
<html lang="bn">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Real Bet - Betting Website</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Baloo+2&display=swap');
  * {
    box-sizing: border-box;
    font-family: 'Baloo 2', cursive;
  }
  body {
    margin: 0;
    background: #1a1a1a;
    color: #eee;
  }
  header {
    background: #ff1f3a;
    padding: 12px 20px;
    font-size: 22px;
    font-weight: 700;
    text-align: center;
    color: #fff;
    position: relative;
  }
  #balance {
    position: absolute;
    top: 12px;
    right: 20px;
    font-weight: 600;
    font-size: 18px;
    cursor: default;
  }
  main {
    padding: 10px 15px;
  }
  .match-list {
    margin-bottom: 90px;
  }
  .match {
    background: #292929;
    margin-bottom: 12px;
    border-radius: 8px;
    padding: 10px;
  }
  .match-title {
    font-size: 18px;
    margin-bottom: 8px;
  }
  .teams {
    display: flex;
    justify-content: space-between;
  }
  .team-btn {
    background: #444;
    border: none;
    color: #fff;
    flex: 1;
    margin: 0 5px;
    padding: 10px 8px;
    font-weight: 600;
    border-radius: 6px;
    cursor: pointer;
    transition: background 0.3s ease;
  }
  .team-btn:hover {
    background: #ff1f3a;
  }
  .team-btn.selected {
    background: #ff1f3a;
  }
  .bet-section {
    margin-top: 8px;
    display: flex;
    align-items: center;
    gap: 8px;
  }
  .bet-input {
    flex: 1;
    padding: 8px 10px;
    border-radius: 5px;
    border: none;
    font-size: 16px;
  }
  .bet-confirm {
    background: #ff1f3a;
    border: none;
    color: #fff;
    padding: 9px 14px;
    border-radius: 5px;
    cursor: pointer;
    font-weight: 600;
  }
  .bet-confirm:disabled {
    background: #d03a49;
    cursor: not-allowed;
  }
  .wallet-icon {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background: #ff1f3a;
    width: 54px;
    height: 54px;
    border-radius: 50%;
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 0 8px #ff1f3aaa;
    z-index: 1000;
  }
  .wallet-icon svg {
    fill: #fff;
    width: 28px;
    height: 28px;
  }
  /* Wallet modal */
  .wallet-modal-bg {
    display: none;
    position: fixed;
    inset: 0;
    background: #000a;
    z-index: 1200;
    justify-content: center;
    align-items: center;
  }
  .wallet-modal {
    background: #222;
    border-radius: 10px;
    max-width: 400px;
    width: 90%;
    padding: 20px 25px;
    color: #eee;
  }
  .wallet-modal h2 {
    margin-top: 0;
    margin-bottom: 15px;
  }
  .wallet-modal label {
    font-weight: 600;
    margin-bottom: 5px;
    display: block;
  }
  .wallet-modal input[type="text"], .wallet-modal input[type="number"] {
    width: 100%;
    padding: 8px 10px;
    margin-bottom: 15px;
    border-radius: 6px;
    border: none;
    font-size: 16px;
  }
  .wallet-modal button {
    background: #ff1f3a;
    border: none;
    color: #fff;
    font-weight: 700;
    padding: 10px 15px;
    border-radius: 6px;
    cursor: pointer;
  }
  .wallet-modal button:disabled {
    background: #d03a49;
    cursor: not-allowed;
  }
  /* Admin icon */
  #admin-icon {
    position: fixed;
    top: 12px;
    left: 15px;
    background: #ff1f3a;
    width: 34px;
    height: 34px;
    border-radius: 50%;
    font-weight: 700;
    font-size: 20px;
    color: #fff;
    text-align: center;
    line-height: 34px;
    cursor: pointer;
    z-index: 1500;
    user-select: none;
  }
  /* Admin modal */
  .admin-modal-bg {
    display: none;
    position: fixed;
    inset: 0;
    background: #000d;
    z-index: 1600;
    justify-content: center;
    align-items: center;
  }
  .admin-modal {
    background: #222;
    border-radius: 10px;
    max-width: 480px;
    width: 95%;
    max-height: 90vh;
    overflow-y: auto;
    padding: 20px 25px;
    color: #eee;
  }
  .admin-modal h2 {
    margin-top: 0;
    margin-bottom: 15px;
  }
  .admin-modal label {
    font-weight: 600;
    margin-bottom: 5px;
    display: block;
  }
  .admin-modal input[type="text"], .admin-modal input[type="number"], .admin-modal select {
    width: 100%;
    padding: 8px 10px;
    margin-bottom: 15px;
    border-radius: 6px;
    border: none;
    font-size: 16px;
  }
  .admin-modal button {
    background: #ff1f3a;
    border: none;
    color: #fff;
    font-weight: 700;
    padding: 10px 15px;
    border-radius: 6px;
    cursor: pointer;
    margin-right: 10px;
  }
  .admin-modal .close-btn {
    background: #888;
  }
  .admin-section {
    margin-bottom: 20px;
  }
  .admin-match-list {
    max-height: 250px;
    overflow-y: auto;
    background: #333;
    border-radius: 8px;
    padding: 10px;
  }
  .admin-match {
    background: #444;
    padding: 8px 10px;
    border-radius: 6px;
    margin-bottom: 8px;
  }
  .admin-match-title {
    font-weight: 600;
  }
  .admin-winner-btns {
    margin-top: 8px;
    display: flex;
    gap: 10px;
  }
  .winner-btn {
    flex: 1;
    padding: 7px 0;
    border-radius: 6px;
    border: none;
    cursor: pointer;
    font-weight: 600;
    color: #fff;
    background: #666;
    transition: background 0.3s ease;
  }
  .winner-btn.selected {
    background: #ff1f3a;
  }
  .admin-history-list {
    max-height: 200px;
    overflow-y: auto;
    background: #333;
    border-radius: 8px;
    padding: 10px;
  }
  .history-item {
    border-bottom: 1px solid #555;
    padding: 6px 0;
  }
  .history-item:last-child {
    border-bottom: none;
  }
  /* Scrollbar for match lists */
  .admin-match-list::-webkit-scrollbar,
  .admin-history-list::-webkit-scrollbar {
    width: 6px;
  }
  .admin-match-list::-webkit-scrollbar-thumb,
  .admin-history-list::-webkit-scrollbar-thumb {
    background: #ff1f3aaa;
    border-radius: 4px;
  }
  /* Responsive */
  @media (max-width: 480px) {
    .teams {
      flex-direction: column;
    }
    .team-btn {
      margin: 5px 0;
    }
  }
</style>
</head>
<body>

<header>
  Real Bet
  <div id="balance" title="আপনার ব্যালেন্স">Balance: ৳0</div>
</header>

<main>
  <div class="match-list" id="match-list">
    <!-- ম্যাচ গুলো এখানে দেখানো হবে -->
  </div>
</main>

<div class="wallet-icon" id="wallet-icon" title="Wallet - Deposit / Withdraw">
  <svg viewBox="0 0 24 24">
    <path d="M21 7H3a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h18v-2H3v-4h18v-2zM12 10a3 3 0 1 0 0 6 3 3 0 0 0 0-6z"/>
  </svg>
</div>

<!-- Wallet Modal -->
<div class="wallet-modal-bg" id="wallet-modal-bg">
  <div class="wallet-modal">
    <h2>Deposit / Withdraw</h2>
    <label>ব্যালেন্স: <span id="wallet-balance">৳0</span></label>

    <label for="wallet-method">পেমেন্ট মেথড</label>
    <select id="wallet-method">
      <option value="bKash">bKash</option>
      <option value="Nagad">Nagad</option>
    </select>

    <label for="wallet-number">নম্বার (01816395401 fixed)</label>
    <input type="text" id="wallet-number" readonly value="01816395401" />

    <label for="wallet-amount">টাকা (৳)</label>
    <input type="number" id="wallet-amount" min="5" placeholder="Amount (Min 5)" />

    <label for="wallet-transaction">Transaction ID</label>
    <input type="text" id="wallet-transaction" placeholder="Transaction ID" />

    <button id="wallet-submit" disabled>Submit Request</button>
    <button id="wallet-close" class="close-btn" style="margin-left:10px; background:#888;">Close</button>
  </div>
</div>

<!-- Admin Icon -->
<div id="admin-icon" title="Admin Panel (Click)">R</div>

<!-- Admin Modal -->
<div class="admin-modal-bg" id="admin-modal-bg">
  <div class="admin-modal">
    <h2>Admin Panel Login</h2>
    <div id="admin-login-section">
      <label for="admin-password">Password:</label>
      <input type="password" id="admin-password" placeholder="Enter password" />
      <button id="admin-login-btn">Login</button>
    </div>
    
    <div id="admin-panel" style="display:none;">
      <h2>Admin Panel</h2>
      
      <div class="admin-section">
        <h3>Upload New Match</h3>
        <label for="match-title">Match Title</label>
        <input type="text" id="match-title" placeholder="Match title e.g. IPL Final" />
        
        <label for="team1-name">Team 1 Name</label>
        <input type="text" id="team1-name" placeholder="Team 1" />
        
        <label for="team1-multiplier">Team 1 Multiplier (e.g. 1.9)</label>
        <input type="number" id="team1-multiplier" step="0.1" min="1" placeholder="1.0" />
        
        <label for="team2-name">Team 2 Name</label>
        <input type="text" id="team2-name" placeholder="Team 2" />
        
        <label for="team2-multiplier">Team 2 Multiplier (e.g. 1.9)</label>
        <input type="number" id="team2-multiplier" step="0.1" min="1" placeholder="1.0" />
        
        <button id="upload-match-btn">Upload Match</button>
      </div>
      
      <div class="admin-section">
        <h3>Matches List & Set Winner</h3>
        <div class="admin-match-list" id="admin-match-list">
          <!-- Uploaded matches shown here -->
        </div>
      </div>
      
      <div class="admin-section">
        <h3>Bet History</h3>
        <div class="admin-history-list" id="admin-history-list">
          <!-- Bet history shown here -->
        </div>
      </div>

      <div class="admin-section">
        <h3>Deposit / Withdraw Requests</h3>
        <div id="admin-requests-list" style="max-height:200px; overflow-y:auto; background:#333; border-radius:8px; padding:10px; color:#eee;">
          <!-- Requests will show here -->
        </div>
      </div>

      <button id="admin-logout-btn" style="background:#888;">Logout</button>
    </div>
  </div>
</div>

<script>
  // Data structures
  let balance = 1000; // শুরু ব্যালেন্স
  let matches = [];
  let bets = [];
  let depositRequests = [];
  let withdrawRequests = [];

  const BALANCE_DISPLAY = document.getElementById('balance');
  const MATCH_LIST = document.getElementById('match-list');
  const ADMIN_ICON = document.getElementById('admin-icon');
  const ADMIN_MODAL_BG = document.getElementById('admin-modal-bg');
  const ADMIN_LOGIN_SECTION = document.getElementById('admin-login-section');
  const ADMIN_PANEL = document.getElementById('admin-panel');
  const ADMIN_PASSWORD_INPUT = document.getElementById('admin-password');
  const ADMIN_LOGIN_BTN = document.getElementById('admin-login-btn');
  const ADMIN_LOGOUT_BTN = document.getElementById('admin-logout-btn');
  const ADMIN_MATCH_LIST = document.getElementById('admin-match-list');
  const ADMIN_HISTORY_LIST = document.getElementById('admin-history-list');
  const ADMIN_REQUESTS_LIST = document.getElementById('admin-requests-list');

  const WALLET_ICON = document.getElementById('wallet-icon');
  const WALLET_MODAL_BG = document.getElementById('wallet-modal-bg');
  const WALLET_BALANCE = document.getElementById('wallet-balance');
  const WALLET_METHOD = document.getElementById('wallet-method');
  const WALLET_NUMBER = document.getElementById('wallet-number');
  const WALLET_AMOUNT = document.getElementById('wallet-amount');
  const WALLET_TRANSACTION = document.getElementById('wallet-transaction');
  const WALLET_SUBMIT = document.getElementById('wallet-submit');
  const WALLET_CLOSE = document.getElementById('wallet-close');

  const MATCH_TITLE_INPUT = document.getElementById('match-title');
  const TEAM1_NAME_INPUT = document.getElementById('team1-name');
  const TEAM1_MULT_INPUT = document.getElementById('team1-multiplier');
  const TEAM2_NAME_INPUT = document.getElementById('team2-name');
  const TEAM2_MULT_INPUT = document.getElementById('team2-multiplier');
  const UPLOAD_MATCH_BTN = document.getElementById('upload-match-btn');

  // Password for admin panel
  const ADMIN_PASSWORD = 'rezoan';

  // Initialize
  updateBalanceDisplay();
  renderMatches();

  // Utility: Save/load from localStorage
  function saveData() {
    localStorage.setItem('realbet_balance', balance);
    localStorage.setItem('realbet_matches', JSON.stringify(matches));
    localStorage.setItem('realbet_bets', JSON.stringify(bets));
    localStorage.setItem('realbet_deposits', JSON.stringify(depositRequests));
    localStorage.setItem('realbet_withdraws', JSON.stringify(withdrawRequests));
  }
  function loadData() {
    balance = Number(localStorage.getItem('realbet_balance')) || 1000;
    matches = JSON.parse(localStorage.getItem('realbet_matches')) || [];
    bets = JSON.parse(localStorage.getItem('realbet_bets')) || [];
    depositRequests = JSON.parse(localStorage.getItem('realbet_deposits')) || [];
    withdrawRequests = JSON.parse(localStorage.getItem('realbet_withdraws')) || [];
  }

  loadData();
  updateBalanceDisplay();
  renderMatches();

  // Update balance UI
  function updateBalanceDisplay() {
    BALANCE_DISPLAY.textContent = `Balance: ৳${balance.toFixed(2)}`;
  }

  // Render matches to user panel
  function renderMatches() {
    MATCH_LIST.innerHTML = '';
    if (matches.length === 0) {
      MATCH_LIST.innerHTML = '<p style="text-align:center; color:#ccc;">কোনো ম্যাচ পাওয়া যায়নি</p>';
      return;
    }

    matches.forEach((match, idx) => {
      const matchDiv = document.createElement('div');
      matchDiv.classList.add('match');

      const titleEl = document.createElement('div');
      titleEl.classList.add('match-title');
      titleEl.textContent = match.title;
      matchDiv.appendChild(titleEl);

      // Teams buttons + bet input + confirm
      const teamsDiv = document.createElement('div');
      teamsDiv.classList.add('teams');

      const team1Btn = document.createElement('button');
      team1Btn.classList.add('team-btn');
      team1Btn.textContent = `${match.team1} (x${match.team1Multiplier})`;
      teamsDiv.appendChild(team1Btn);

      const team2Btn = document.createElement('button');
      team2Btn.classList.add('team-btn');
      team2Btn.textContent = `${match.team2} (x${match.team
