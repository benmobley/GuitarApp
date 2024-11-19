const canvas = document.getElementById("fretboard");
const ctx = canvas.getContext("2d");

const fretCount = 12; // Number of frets
const stringCount = 6; // Number of strings

const fretboardWidth = canvas.width;
const fretboardHeight = canvas.height;
const fretWidth = fretboardWidth / fretCount;
const stringSpacing = fretboardHeight / (stringCount + 1);

const chords = {
  A: [null, 0, 2, 2, 2, 0],
};

// Function to draw the fretboard
function drawFretboard() {
  ctx.clearRect(0, 0, fretboardWidth, fretboardHeight);

  // Draw frets
  for (let i = 0; i <= fretCount; i++) {
    const x = i * fretWidth;
    ctx.beginPath();
    ctx.moveTo(x, 0);
    ctx.lineTo(x, fretboardHeight);
    ctx.strokeStyle = "#333";
    ctx.lineWidth = 2;
    ctx.stroke();
  }

  // Draw strings
  for (let j = 1; j <= stringCount; j++) {
    const y = j * stringSpacing;
    ctx.beginPath();
    ctx.moveTo(0, y);
    ctx.lineTo(fretboardWidth, y);
    ctx.strokeStyle = "#666";
    ctx.lineWidth = j * 0.5; // Strings get thicker
    ctx.stroke();
  }

  // Draw fret markers
  const markers = [3, 5, 7, 9, 12];
  markers.forEach((fret) => {
    const x = (fret - 0.5) * fretWidth;
    const radius = 5;
    if (fret === 12) {
      // 12th fret has double markers
      ctx.beginPath();
      ctx.arc(x, stringSpacing * 2, radius, 0, Math.PI * 2);
      ctx.arc(x, stringSpacing * 5, radius, 0, Math.PI * 2);
      ctx.fillStyle = "#333";
      ctx.fill();
    } else {
      ctx.beginPath();
      ctx.arc(x, fretboardHeight / 2, radius, 0, Math.PI * 2);
      ctx.fillStyle = "#333";
      ctx.fill();
    }
  });
}

function displayChord(chordName) {
  drawFretboard(); // Redraw the fretboard first to clear any previous chord
  const chord = chords[chordName];
  if (!chord) {
    return;
  }
  // Draw circles for each fret position
  chord.forEach((fret, string) => {
    if (fret !== "X") {
      // Check if the string is played
      const x = fret * fretWidth - fretWidth / 2;
      const y = (stringCount - string) * stringSpacing;

      ctx.beginPath();
      ctx.arc(x, y, 10, 0, Math.PI * 2); // Radius of 10 for the circle
      ctx.fillStyle = "blue";
      ctx.fill();
    }
  });

  chord.forEach((fret, string) => {
    if (fret === 0) {
      const x = fretWidth / 2000; // Position the open string circle on the left side of fretboard
      const y = (stringCount - string) * stringSpacing;

      ctx.beginPath();
      ctx.arc(x, y, 8, 0, Math.PI * 2); // Slightly smaller radius for open string
      ctx.fillStyle = "blue";
      ctx.fill();
    }
  });
}

// Initial draw
drawFretboard();
