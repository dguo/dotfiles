#!/usr/bin/env node

const fs = require("fs");
const os = require("os");

let log = fs.readFileSync(`${os.homedir()}/.keys.log`, "utf8")
// Remove instances of three repeated characters in a row
log = log.replace(/(.)\1{2,}/g, " ");

function getScore(string, frequency) {
    return string.length * frequency;
}

const counts = new Map();
for (let i = 0; i < log.length; i++) {
    for (let j = i + 3; j < i + 40; j++) {
        const substring = log.slice(i, j);
        if (!/^\s+$/g.test(substring)) {
            const currentValue = counts.get(substring);
            const newFrequency = currentValue ? currentValue.frequency + 1 : 1;
            counts.set(substring, {
                score: getScore(substring, newFrequency),
                frequency: newFrequency
            });
        }
   }
}

const sorted = new Map([...counts].sort((a, b) => {
    return b[1].score - a[1].score;
}));

let count = 0;
for (const entry of sorted) {
    console.log(entry);
    count++;
    if (count > 1000) {
        break;
    }
}
