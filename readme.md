# Template voor een Craft CMS project met Vite
Dit is een template voor een Craft CMS project met Vite. Het is bedoeld om snel een nieuwe Craft CMS website op te zetten met een moderne front-end workflow.

## Installatie
1. Start een eigen project vanaf de template op https://github.com/howest-WDD/2024-2025-craft-vite-template of clone een opdracht vanaf GitHub Classroom 
2. Pas `/ddev/config.yaml` aan met een unieke `name`
3. Voer `ddev start`uit
4. Voer `ddev composer install` uit
5. Voer `ddev npm install` uit
6. Voer `ddev craft setup` uit om de Craft CMS installatie te voltooien
    1. Kies steeds voor de default voorgestelde antwoorden
7. Start het project op via `ddev launch` of `ddev restart`
8. Schrijf je **javascript** en **scss** in de `/src/*` folder
    1. Importeer de scss in het javascript bestand dat je laadt in de template
9. In de head van de template laad je het javascript bestand uit de source folder `{{ craft.vite.script('src/js/app.js', false) }}`
