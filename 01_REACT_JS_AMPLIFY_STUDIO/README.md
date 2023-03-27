 # Starting React App
- [Create react app, getting started](https://create-react-app.dev/docs/getting-started/)

```sh
# source ~/.bash_profile
npx clear-npx-cache
npx create-react-app kio-sl-suan-amplify-studio-rjs-app

```
 
 # Local setup from Amplify Studio

```sh
amplify pull --appId d3q1aqlxck7ugu --envName staging

amplify pull --appId d3q1aqlxck7ugu --envName staging
Opening link: https://us-east-1.admin.amplifyapp.com/admin/d3q1aqlxck7ugu/staging/verify/
✔ Successfully received Amplify Studio tokens.
Amplify AppID found: d3q1aqlxck7ugu. Amplify App name is: suan-amplify-studio
Backend environment staging found in Amplify Console app: suan-amplify-studio
? Choose your default editor: Visual Studio Code
? Choose the type of app that you're building javascript
Please tell us about your project
? What javascript framework are you using react
? Source Directory Path:  src
? Distribution Directory Path: build
? Build Command:  npm run-script build
? Start Command: npm run-script start
✔ Synced UI components.
UIBuilder components required "@aws-amplify/ui-react" that is not in your package.json. Please run `npm install @aws-amplify/ui-react`
UIBuilder components required "aws-amplify" that is not in your package.json. Please run `npm install aws-amplify`
GraphQL schema compiled successfully.

Edit your schema at /Users/robin8a/Documents/react_ws/kio-sl-suan-amplify-studio-rjs-app/amplify/backend/api/suanamplifystudio/schema.graphql or place .graphql files in a directory at /Users/robin8a/Documents/react_ws/kio-sl-suan-amplify-studio-rjs-app/amplify/backend/api/suanamplifystudio/schema
Successfully generated models. Generated models can be found in /Users/robin8a/Documents/react_ws/kio-sl-suan-amplify-studio-rjs-app/src
? Do you plan on modifying this backend? No

Added backend environment config object to your project.
Run 'amplify pull' to sync future upstream changes.

```

## Installing dependecies

```sh
npm install @aws-amplify/ui-react
npm install aws-amplify
```

# Amplify Studio Docs 
https://docs.amplify.aws/console/#visual-backend-builder---works-with-amplify-cli
