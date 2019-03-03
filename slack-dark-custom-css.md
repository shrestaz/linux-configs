# Dark theme for Slack on Linux

![screenshot_20190303_162153](https://user-images.githubusercontent.com/9460504/53697432-4533e980-3dd1-11e9-877e-1dcb649fd114.png)


1. Open `code /usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js` in a text editor.

2. Add the following snippet in the very bottom.

```javascript
// First make sure the wrapper app is loaded
document.addEventListener("DOMContentLoaded", function () {

  // Then get its webviews
  let webviews = document.querySelectorAll(".TeamView webview");

  // Fetch our CSS in parallel ahead of time
  const cssPath = 'https://raw.githubusercontent.com/mallowigi/slack-one-dark-theme/master/custom.css';
  let cssPromise = fetch(cssPath).then(response => response.text());

  let customCustomCSS = `
  :root {
     /* Modify these to change your theme colors: */
    --primary: #45a6ff;
    --accent: #568AF2;
    --text: #e5e5e5;
    --background: #1a1f29;
    --background-elevated: #1c1f24;

    /* These should be less important: */
    --background-hover: lighten(#3B4048, 10%);
    --background-light: #AAA;
    --background-bright: #FFF;

    --border-dim: #666;
    --border-bright: var(--primary);

    --text-bright: #FFF;
    --text-dim: #555c69;
    --text-special: var(--primary);
    --text-accent: var(--text-bright);

    --scrollbar-background: #000;
    --scrollbar-border: var(--primary);

    --yellow: #fc0;
    --green: #98C379;
    --cyan: #56B6C2;
    --blue: #61AFEF;
    --purple: #C678DD;
    --red: #E06C75;
    --red2: #BE5046;
    --orange: #D19A66;
    --orange2: #E5707B;
    --gray: #3E4451;
    --silver: #9da5b4;
    --black: #21252b;
     }
  `

  // Insert a style tag into the wrapper view
  cssPromise.then(css => {
    let s = document.createElement('style');
    s.type = 'text/css';
    s.innerHTML = css + customCustomCSS;
    document.head.appendChild(s);
  });

  // Wait for each webview to load
  webviews.forEach(webview => {
    webview.addEventListener('ipc-message', message => {
      if (message.channel == 'didFinishLoading')
        // Finally add the CSS into the webview
        cssPromise.then(css => {
          let script = `
                    let s = document.createElement('style');
                    s.type = 'text/css';
                    s.id = 'slack-custom-css';
                    s.innerHTML = \`${css + customCustomCSS}\`;
                    document.head.appendChild(s);
                    `
          webview.executeJavaScript(script);
        })
    });
  });
});

```

3. Restart the session to see changes.

----

Based on [this repository](https://mallowigi.github.io/slack-one-dark-theme/). Thanks🏆🙏