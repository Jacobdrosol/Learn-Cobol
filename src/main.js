import './styles.css';

const sections = [
  {
    title: 'Start tomorrow',
    items: [
      'Open COURSE.md and follow Day 1.',
      'Run source scripts/env.sh.',
      'Run make test before changing anything.',
      'Start with exercises/01-hello and exercises/02-arithmetic.',
    ],
  },
  {
    title: 'What you will build',
    items: [
      'COBOL syntax drills with expected output tests.',
      'Batch payroll reporting with file input and totals.',
      'Bank ledger posting with rejects and balances.',
      'Core banking capstone with copybooks and JCL notes.',
    ],
  },
  {
    title: 'Mainframe coverage',
    items: [
      'COBOL divisions, data definitions, files, tables, and subprograms.',
      'JCL JOB, EXEC, DD, SYSOUT, return codes, and batch operations.',
      'z/OS, JES, TSO/ISPF, SDSF, USS, RACF, VSAM, Db2, CICS, IMS, and Zowe.',
      'Portfolio guidance for junior mainframe developer applications.',
    ],
  },
];

const commands = [
  'source scripts/env.sh',
  'make verify',
  'make test',
  'make payroll',
  'make ledger',
  'make capstone',
];

document.querySelector('#app').innerHTML = `
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
        <p class="lede">
          A runnable month-long path for COBOL, JCL, z/OS concepts, batch
          programming, and portfolio projects you can practice without internet.
        </p>
        <div class="actions">
          <a class="button primary" href="#workflow">Start path</a>
          <a class="button secondary" href="#commands">Run locally</a>
        </div>
      </div>
      <div class="terminal" aria-label="Local setup command preview">
        <div class="terminal-bar">
          <span></span><span></span><span></span>
        </div>
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
        ${sections
          .map(
            (section) => `
              <article class="panel">
                <h3>${section.title}</h3>
                <ul>
                  ${section.items.map((item) => `<li>${item}</li>`).join('')}
                </ul>
              </article>
            `,
          )
          .join('')}
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
        ${commands.map((command) => `<code>${command}</code>`).join('')}
      </div>
    </section>
  </main>
`;
