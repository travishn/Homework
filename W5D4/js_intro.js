"use strict";

// Phase I
function madLib(verb, adh, noun) {
  return `We shall ${verb.toUpperCase()} the ${adh.toUpperCase()} ${noun.toUpperCase()}.`
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

// Phase II
function fizzBuzz(arr) {
  let result = [];

  arr.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      result.push(el);
    }
  });

  return result
}

function isPrime(num) {
  if num < 2 { return false; }

  for (let i = 2; i < num; i++) {
    if (num % i === 0 ) {
      return false;
    }
  }

  return true;
}

function sumOfNPrimes(n) {
  let sum = 0;
  let prime_count = 0;
  let i = 2;

  while prime_count < n {
    if (isPrime(i)) {
      sum += i;
      prime_count++;
    }

    i++;
  }

  return sum;
}
