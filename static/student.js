var current_program= [  { id: "mechanical", label: "Mechanical Engineering", value: "mechanical" },  { id: "electrical", label: "Electrical Engineering", value: "electrical" },  { id: "computer", label: "Computer Engineering", value: "computer" }];

var container = document.createElement("div");
container.id = "major_discipline";

var label = document.createElement("label");
label.innerHTML = "major_discipline";
container.appendChild(label);
container.appendChild(document.createElement("br"));

current_program.forEach(function (branch) {
  var input = document.createElement("input");
  input.type = "checkbox";
  input.id = branch.id;
  input.name = "major_discipline[]";
  input.value = branch.value;

  var label = document.createElement("label");
  label.innerHTML = branch.label;
  label.setAttribute("for", branch.id);

  container.appendChild(input);
  container.appendChild(label);
  container.appendChild(document.createElement("br"));
});

document.body.appendChild(container);
