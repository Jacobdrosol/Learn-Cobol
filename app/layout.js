import './globals.css';

export const metadata = {
  title: 'Learn-Cobol',
  description:
    'Offline-first COBOL and mainframe practice course with runnable exercises, tests, and portfolio projects.',
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
