import { mkdir, rm, writeFile } from 'node:fs/promises';

const html = String.raw`<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Learn-Cobol is an offline-first COBOL and mainframe practice course with runnable exercises, tests, and portfolio projects." />
    <title>Learn-Cobol</title>
    <style>
      :root {
        color: #1d252c;
        background: #f4f1ea;
        font-family: Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
        font-synthesis: none;
        text-rendering: optimizeLegibility;
      }
      * { box-sizing: border-box; }
      body {
        margin: 0;
        min-width: 320px;
        background:
          linear-gradient(90deg, rgba(29, 37, 44, 0.05) 1px, transparent 1px),
          linear-gradient(180deg, rgba(29, 37, 44, 0.05) 1px, transparent 1px),
          #f4f1ea;
        background-size: 42px 42px;
      }
      a { color: inherit; text-decoration: none; }
      .topbar {
        position: sticky;
        top: 0;
        z-index: 10;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 24px;
        min-height: 64px;
        padding: 0 32px;
        background: rgba(244, 241, 234, 0.92);
        border-bottom: 1px solid rgba(29, 37, 44, 0.15);
        backdrop-filter: blur(12px);
      }
      .brand { font-weight: 800; }
      .nav-links {
        display: flex;
        gap: 18px;
        color: #40505b;
        font-size: 0.94rem;
      }
      .hero {
        display: grid;
        grid-template-columns: minmax(0, 1.1fr) minmax(320px, 0.9fr);
        align-items: center;
        gap: 48px;
        width: min(1160px, calc(100% - 40px));
        min-height: calc(100vh - 64px);
        margin: 0 auto;
        padding: 56px 0 84px;
      }
      .hero-copy { max-width: 720px; }
      .eyebrow {
        margin: 0 0 12px;
        color: #8b3f2f;
        font-size: 0.8rem;
        font-weight: 800;
        letter-spacing: 0;
        text-transform: uppercase;
      }
      h1, h2, h3, p { margin-top: 0; }
      h1 {
        margin-bottom: 20px;
        color: #17202a;
        font-size: clamp(3.5rem, 13vw, 8.5rem);
        line-height: 0.9;
        letter-spacing: 0;
      }
      h2 {
        margin-bottom: 18px;
        color: #17202a;
        font-size: clamp(2rem, 5vw, 4.5rem);
        line-height: 1;
        letter-spacing: 0;
      }
      h3 {
        margin-bottom: 12px;
        color: #17202a;
        font-size: 1.25rem;
        line-height: 1.2;
        letter-spacing: 0;
      }
      .lede {
        max-width: 670px;
        color: #40505b;
        font-size: clamp(1.08rem, 2vw, 1.35rem);
        line-height: 1.6;
      }
      .actions {
        display: flex;
        flex-wrap: wrap;
        gap: 12px;
        margin-top: 32px;
      }
      .button {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 44px;
        padding: 0 18px;
        border: 1px solid #17202a;
        border-radius: 6px;
        font-weight: 800;
      }
      .primary { color: #f9f6ef; background: #17202a; }
      .secondary { color: #17202a; background: transparent; }
      .terminal {
        overflow: hidden;
        border: 1px solid rgba(29, 37, 44, 0.22);
        border-radius: 8px;
        background: #17202a;
        box-shadow: 0 24px 70px rgba(29, 37, 44, 0.26);
      }
      .terminal-bar {
        display: flex;
        gap: 8px;
        padding: 14px 16px;
        border-bottom: 1px solid rgba(255, 255, 255, 0.12);
      }
      .terminal-bar span {
        width: 11px;
        height: 11px;
        border-radius: 50%;
        background: #d6654a;
      }
      .terminal-bar span:nth-child(2) { background: #d6a84a; }
      .terminal-bar span:nth-child(3) { background: #62a86f; }
      pre {
        margin: 0;
        padding: 24px;
        overflow: auto;
        color: #e8f0ed;
        font-size: clamp(0.86rem, 2vw, 1rem);
        line-height: 1.55;
      }
      .band, .split {
        width: min(1160px, calc(100% - 40px));
        margin: 0 auto;
        padding: 84px 0;
      }
      .section-heading {
        max-width: 760px;
        margin-bottom: 32px;
      }
      .grid {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 16px;
      }
      .panel, .project-list article {
        min-height: 260px;
        padding: 24px;
        border: 1px solid rgba(29, 37, 44, 0.18);
        border-radius: 8px;
        background: rgba(255, 252, 245, 0.75);
      }
      ul {
        display: grid;
        gap: 10px;
        margin: 0;
        padding-left: 20px;
        color: #40505b;
        line-height: 1.5;
      }
      .split {
        display: grid;
        grid-template-columns: minmax(260px, 0.8fr) minmax(0, 1.2fr);
        gap: 28px;
      }
      .project-list { display: grid; gap: 14px; }
      .project-list article { min-height: 0; }
      .project-list p {
        margin-bottom: 0;
        color: #40505b;
        line-height: 1.55;
      }
      .command-band { padding-bottom: 110px; }
      .commands {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 12px;
      }
      .commands code {
        display: block;
        min-height: 48px;
        padding: 15px 16px;
        overflow-wrap: anywhere;
        border: 1px solid rgba(29, 37, 44, 0.2);
        border-radius: 6px;
        color: #e8f0ed;
        background: #26333d;
      }
      @media (max-width: 820px) {
        .topbar {
          align-items: flex-start;
          flex-direction: column;
          padding: 14px 20px;
        }
        .hero, .split { grid-template-columns: 1fr; }
        .hero { min-height: auto; padding-top: 48px; }
        .grid, .commands { grid-template-columns: 1fr; }
      }
    </style>
  </head>
  <body>
    <main>
      <nav class="topbar" aria-label="Primary navigation">
        <a class="brand" href="#top">Learn-Cobol</a>
        <div class="nav-links">
          <a href="#workflow">Workflow</a>
          <a href="#projects">Projects</a>
          <a href="#commands">Commands</a>
        </div>
      </nav>
      <section class="hero" id="top">
        <div class="hero-copy">
          <p class="eyebrow">Offline-first COBOL and mainframe practice</p>
          <h1>Learn-Cobol</h1>
          <p class="lede">A runnable month-long path for COBOL, JCL, z/OS concepts, batch programming, and portfolio projects you can practice without internet.</p>
          <div class="actions">
            <a class="button primary" href="#workflow">Start path</a>
            <a class="button secondary" href="#commands">Run locally</a>
          </div>
        </div>
        <div class="terminal" aria-label="Local setup command preview">
          <div class="terminal-bar"><span></span><span></span><span></span></div>
          <pre><code>$ source scripts/env.sh
$ make test
ok: hello
ok: payroll
ok: ledger
ok: capstone
all tests passed</code></pre>
        </div>
      </section>
      <section class="band" id="workflow">
        <div class="section-heading">
          <p class="eyebrow">Course structure</p>
          <h2>Built for concentrated practice</h2>
        </div>
        <div class="grid">
          <article class="panel">
            <h3>Start tomorrow</h3>
            <ul>
              <li>Open COURSE.md and follow Day 1.</li>
              <li>Run source scripts/env.sh.</li>
              <li>Run make test before changing anything.</li>
              <li>Start with exercises/01-hello and exercises/02-arithmetic.</li>
            </ul>
          </article>
          <article class="panel">
            <h3>What you will build</h3>
            <ul>
              <li>COBOL syntax drills with expected output tests.</li>
              <li>Batch payroll reporting with file input and totals.</li>
              <li>Bank ledger posting with rejects and balances.</li>
              <li>Core banking capstone with copybooks and JCL notes.</li>
            </ul>
          </article>
          <article class="panel">
            <h3>Mainframe coverage</h3>
            <ul>
              <li>COBOL divisions, data definitions, files, tables, and subprograms.</li>
              <li>JCL JOB, EXEC, DD, SYSOUT, return codes, and batch operations.</li>
              <li>z/OS, JES, TSO/ISPF, SDSF, USS, RACF, VSAM, Db2, CICS, IMS, and Zowe.</li>
              <li>Portfolio guidance for junior mainframe developer applications.</li>
            </ul>
          </article>
        </div>
      </section>
      <section class="split" id="projects">
        <div>
          <p class="eyebrow">Portfolio projects</p>
          <h2>Show tested batch work, not just notes</h2>
        </div>
        <div class="project-list">
          <article>
            <h3>Batch Payroll</h3>
            <p>Reads employee records, calculates gross/net pay, and reports totals.</p>
          </article>
          <article>
            <h3>Bank Ledger</h3>
            <p>Posts transactions, rejects unknown accounts, and prints final balances.</p>
          </article>
          <article>
            <h3>Core Banking Capstone</h3>
            <p>Uses copybooks, account master records, transaction records, and control output.</p>
          </article>
        </div>
      </section>
      <section class="band command-band" id="commands">
        <div class="section-heading">
          <p class="eyebrow">Local commands</p>
          <h2>Use these before boarding</h2>
        </div>
        <div class="commands">
          <code>source scripts/env.sh</code>
          <code>make verify</code>
          <code>make test</code>
          <code>make payroll</code>
          <code>make ledger</code>
          <code>make capstone</code>
        </div>
      </section>
    </main>
  </body>
</html>`;

const worker = `const html = ${JSON.stringify(html)};

export default {
  async fetch() {
    return new Response(html, {
      headers: {
        'content-type': 'text/html; charset=utf-8',
        'cache-control': 'public, max-age=300',
      },
    });
  },
};
`;

await rm('dist', { recursive: true, force: true });
await mkdir('dist/server', { recursive: true });
await writeFile('dist/index.js', worker);
await writeFile('dist/server/index.js', worker);
await writeFile('dist/index.html', html);
console.log('Built Learn-Cobol site to dist/server/index.js, dist/index.js, and dist/index.html');
