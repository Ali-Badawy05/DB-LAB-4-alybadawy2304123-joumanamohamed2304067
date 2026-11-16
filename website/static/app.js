(function () {
  function val(form, name) {
    var el = form.elements[name];
    return el ? el.value : "";
  }

  function imageErrors(form, name) {
    var el = form.elements[name];
    if (!el || !el.files || !el.files.length) return [];
    if (el.files[0].size > 4 * 1024 * 1024) return ["The image is too big (4 MB at most)"];
    return [];
  }

  var rules = {
    register: function (f) {
      var e = [];
      if (!val(f, "name").trim()) e.push("Name is required");
      if (!val(f, "email").trim()) e.push("Email is required");
      if (!val(f, "password")) e.push("Password is required");
      if (!val(f, "confirm_password")) e.push("Confirm password is required");
      if (val(f, "password") && val(f, "confirm_password") &&
          val(f, "password") !== val(f, "confirm_password")) e.push("Passwords do not match");
      return e;
    },
    login: function (f) {
      var e = [];
      if (!val(f, "email").trim()) e.push("Email is required");
      if (!val(f, "password")) e.push("Password is required");
      return e;
    },
    author: function (f) {
      var e = [];
      var n = val(f, "name").trim(), c = val(f, "country").trim();
      if (!n) e.push("Name is required");
      else if (n.length > 100) e.push("Name is too long (100 characters at most)");
      if (!c) e.push("Country is required");
      else if (c.length > 50) e.push("Country is too long (50 characters at most)");
      return e.concat(imageErrors(f, "photo"));
    },
    book: function (f) {
      var e = [];
      var t = val(f, "title").trim(), p = val(f, "price").trim();
      if (!t) e.push("Title is required");
      else if (t.length > 200) e.push("Title is too long (200 characters at most)");
      if (!p) e.push("Price is required");
      else if (!/^\d+(\.\d{1,2})?$/.test(p)) e.push("Price must be a number with at most 2 decimal places");
      var y = val(f, "publish_year").trim();
      if (!/^\d{4}$/.test(y)) e.push("Publish year must be a year like 1999");
      if (!val(f, "author_id")) e.push("Choose an author");
      if (!val(f, "publisher_id")) e.push("Choose a publisher");
      if (!val(f, "category_id")) e.push("Choose a category");
      return e.concat(imageErrors(f, "cover"));
    },
    search: function (f) {
      var e = [];
      var lo = val(f, "min_price").trim(), hi = val(f, "max_price").trim();
      var money = /^\d+(\.\d{1,2})?$/;
      if (lo && !money.test(lo)) e.push("Minimum price must be a number (2 decimals at most)");
      if (hi && !money.test(hi)) e.push("Maximum price must be a number (2 decimals at most)");
      if (!e.length && lo && hi && parseFloat(lo) > parseFloat(hi)) e.push("Minimum price is bigger than maximum price");
      return e;
    },
    todo: function (f) {
      var t = val(f, "title").trim();
      if (!t) return ["Title is required"];
      if (t.length > 200) return ["Title is too long (200 characters at most)"];
      return [];
    }
  };

  document.querySelectorAll("form[data-form]").forEach(function (form) {
    form.addEventListener("submit", function (ev) {
      var errors = rules[form.dataset.form](form);
      var box = form.querySelector(".errors");
      box.innerHTML = "";
      if (errors.length) {
        ev.preventDefault();
        errors.forEach(function (msg) {
          var li = document.createElement("li");
          li.textContent = msg;
          box.appendChild(li);
        });
      }
    });
  });

  // Delete confirmation
  document.querySelectorAll("form[data-confirm]").forEach(function (form) {
    form.addEventListener("submit", function (ev) {
      if (!window.confirm(form.dataset.confirm)) ev.preventDefault();
    });
  });
})();

// Dark mode
(function () {
  var btn = document.getElementById("theme-toggle");
  if (!btn) return;
  function paint() {
    var dark = document.documentElement.getAttribute("data-theme") === "dark";
    btn.textContent = dark ? "☀️" : "🌙";
  }
  paint();
  btn.addEventListener("click", function () {
    var next = document.documentElement.getAttribute("data-theme") === "dark" ? "light" : "dark";
    document.documentElement.setAttribute("data-theme", next);
    try { localStorage.setItem("theme", next); } catch (e) {}
    paint();
  });
})();
