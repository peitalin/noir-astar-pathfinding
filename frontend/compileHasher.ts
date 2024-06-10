import path from 'path';
import { writeFileSync } from 'fs';
// @ts-ignore -- no types
import { mimc7Contract as mimcContract } from 'circomlibjs';

const outputPath = path.join("../src", 'Hasher.json')

function main() {
  const contract = {
    contractName: 'Hasher',
    abi: mimcContract.abi,
    bytecode: mimcContract.createCode('mimc', 91),
  }

  writeFileSync(outputPath, JSON.stringify(contract))
}

main()