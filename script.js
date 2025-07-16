// Ambil data script dari scripts.json
fetch("scripts.json")
  .then((res) => res.json())
  .then((data) => {
    window.allScripts = data; // simpan data ke variabel global
    renderScripts(data);      // render semua script ke halaman
  });

const container = document.getElementById("scriptContainer");
const searchBar = document.getElementById("searchBar");

// Tampilkan script dalam bentuk kartu
function renderScripts(scripts) {
  container.innerHTML = "";
  scripts.forEach((script) => {
    const div = document.createElement("div");
    div.className = "script-card";
    div.innerHTML = `
      <h2>${script.title}</h2>
      <p><strong>Game:</strong> ${script.game}</p>
      <p>${script.description}</p>
      <p><strong>Views:</strong> ${script.views.toLocaleString()}</p>
      <button onclick="copyScript('${script.loadstring}')">📋 Copy Loadstring</button>
    `;
    container.appendChild(div);
  });
}

// Filter berdasarkan input search
searchBar.addEventListener("input", () => {
  const keyword = searchBar.value.toLowerCase();
  const filtered = allScripts.filter((s) =>
    s.title.toLowerCase().includes(keyword) ||
    s.game.toLowerCase().includes(keyword)
  );
  renderScripts(filtered);
});

// Fungsi untuk copy loadstring ke clipboard
function copyScript(link) {
  const fullLoadstring = `loadstring(game:HttpGet("${link}"))()`;
  navigator.clipboard.writeText(fullLoadstring).then(() => {
    alert("✅ Loadstring copied to clipboard!");
  });
}
