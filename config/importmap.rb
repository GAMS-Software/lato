pin "lato/application", to: "lato/application.js"
pin_all_from Lato::Engine.root.join("app/assets/javascripts/lato/controllers"), under: "controllers", to: "lato/controllers"

pin "bootstrap", to: "bootstrap.js", preload: true
# pin "@popperjs/core", to: "popper.js", preload: true
