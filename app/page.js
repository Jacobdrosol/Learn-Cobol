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

export default function Home() {
  return (
    <main>
      <nav className="topbar" aria-label="Primary navigation">
        <a className="brand" href="#top">
          Learn-Cobol
        </a>
        <div className="nav-links">
          <a href="#workflow">Workflow</a>
          <a href="#projects">Projects</a>
          <a href="#commands">Commands</a>
        </div>
      </nav>

      <section className="hero" id="top">
        <div className="hero-copy">
          <p className="eyebrow">Offline-first COBOL and mainframe practice</p>
          <h1>Learn-Cobol</h1>
          <p className="lede">
            A runnable month-long path for COBOL, JCL, z/OS concepts, batch
            programming, and portfolio projects you can practice without internet.
          </p>
          <div className="actions">
            <a className="button primary" href="#workflow">
              Start path
            </a>
            <a className="button secondary" href="#commands">
              Run locally
            </a>
          </div>
        </div>
        <div className="terminal" aria-label="Local setup command preview">
          <div className="terminal-bar">
            <span></span>
            <span></span>
            <span></span>
          </div>
          <pre>
            <code>{`$ source scripts/env.sh
$ make test
ok: hello
ok: payroll
ok: ledger
ok: capstone
all tests passed`}</code>
          </pre>
        </div>
      </section>

      <section className="band" id="workflow">
        <div className="section-heading">
          <p className="eyebrow">Course structure</p>
          <h2>Built for concentrated practice</h2>
        </div>
        <div className="grid">
          {sections.map((section) => (
            <article className="panel" key={section.title}>
              <h3>{section.title}</h3>
              <ul>
                {section.items.map((item) => (
                  <li key={item}>{item}</li>
                ))}
              </ul>
            </article>
          ))}
        </div>
      </section>

      <section className="split" id="projects">
        <div>
          <p className="eyebrow">Portfolio projects</p>
          <h2>Show tested batch work, not just notes</h2>
        </div>
        <div className="project-list">
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
            <p>
              Uses copybooks, account master records, transaction records, and
              control output.
            </p>
          </article>
        </div>
      </section>

      <section className="band command-band" id="commands">
        <div className="section-heading">
          <p className="eyebrow">Local commands</p>
          <h2>Use these before boarding</h2>
        </div>
        <div className="commands">
          {commands.map((command) => (
            <code key={command}>{command}</code>
          ))}
        </div>
      </section>
    </main>
  );
}
