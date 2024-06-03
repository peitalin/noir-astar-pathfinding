// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {UltraVerifier} from "../circuits-radius/contract/radius/plonk_vk.sol";
import {Radius} from "../src/Radius.sol";


contract UltraVerifierTest is Test {

	UltraVerifier public plonkVerifier;
	Radius public radius;

	// public inputs
	bytes32 _correctInput1 = 0x0000000000000000000000000000000000000000000000000000000000000032;
	bytes32[] correctInputs = new bytes32[](1);

	bytes32 _wrongInput1 = 0x0000000000000000000000000000000000000000000000000000000000111111;
	bytes32[] wrongInputs = new bytes32[](1);

	// bytes proofHexStr = hex"079c105f5380ed521bd63f87343f92f0cc29d38c8a4dc950ec0c9912a219ee6f11d07b2ddf6d1751cd148f876b4b27429ff90ac2b9c124676a157127c69cc7dd14f0eb64eaf079585188565810dca512dd402c4425ed948b56c55d3358f06ddc10faeb2a4f061d182e1e314d013e1770abc159c2cb404d17b4889a84f9ae2e482f2eddeb6b78f5fd82b1982060f6e6159758481ae6a89b0bbe0da250cd5ff3601c5de597048ee3517d3106dee5c57640c7b691cd6dc5ae419b95c407a164360b2b5d75a951c603076c81a79a4517e5e331a3634b0f51fab1b25a1377ba45a8661c7f9dbaff15845472f06d4cd5d4b249652ee124d3b8da7dba6b7b1361dcb0b202718f4babd98721078da7741effce180536766d786d5b3688d34c5dddd856a413b038ff24b5e2da3ded6e1fb048e9d9a711454013826be24cd24fc6f0f838970c825484b8f424df638c880e1745bfece677e48431ea65ea30de701b1693755310ea1647a4f3729a4fa7cc9e57ff49411ba636c9a617d860637df1291aee6bee0eb9d64c6e69c9bc3caaa00d4c6e2be314ca9d4609db7d64131a9870c0687ab52609913f9a2638b1448537d1bc6b319284ea13a9e778d531b8e590a74ea11ac50af1608d515af5f8d0965c7cdaee4bccaf82dcbc0256e7b641605f04423b84a92e27f46417350b34d89324124b1f6c98d8fdd6df1e25c253701dd4d573d65821133709eebe775e3a805b72f8bd3369a6d405fe3065373b018f0f502b40addc60304101a95caded5c5c637a898f7a75d4ac08cdf749208ab51e13f1f9e5b0d3871891c4d67989ffaaf34532a8303c0c0dd1ffd48b54a5624180e0cd3864c8ab1b07113b27144566f6eb2157f859a90e4bc8839e33a23687d8ab7ec39f5c57a35d0a0dc1db3da5c2481218ce66e784eaef178f947302261e49dcdfddf15a2b818311419e1fbae3648ef6efc073a2671f9ae55445a589725e74a6091bcb31dcb7ee1f97c9ed08b1a42dec5628f09a37f40589d9f85e27a386dd4d7aad6627c4236b0f8465d2ce72c83c52193de5f1af9db2bd9568a34affc0eb9ae6135306f22706045a58ec1fad7eb98e79419d047425b81863621f69cf75f591d685865b89f6940b905d94b46adff587d90674a54b6b20be6f5aa2c4e869551be79aa8701fb989249f3808344009827235368614af9ec27764449352b022adf6666db7638e569a2cdcd9e48221c9a453f430f76e4ca561e1a60e25faaa020c3d9097f95ed825de2e1005b9b39a3c30facd375d3ff0281e215649523c736b117799411863e599ed186fccb4855660be4984b9a8b1735ffc374d42c83d342f3b9bdaba49bc0fe5881f1daf4615873426eb06d46c897a92c4ac1c5be1db9d79dd3dbee11c85076e51144857375741ff61203d955dc817081f988cc055f805cb74654142db970410c10493f16e24bc07938d332549b414a945d14e30d4bd81c77028658109c38682dd1c71663a47cea388372abaf1eb807160d529f0ac0f837b9a3a619033b03fc1112e459cca52233dceddc87f07094b63bf407dbd273645c200421af0ad508ce92c2b565b667f7ecd6dff6d4a059acc1f23ac1f6a72fa0ad5f01274e90def2c95710c37a62c82ddb3ffef77b24eff7c787f434db0b378c8ed580ce1a54b15fa71720b55fe11bb64110506de50638098e7e4da0622aecc02880301cfd9d5c1f386f61cb9df1d8d0df2f70c2e37ab64b890e4716d73f6d25d11fadfc07cc97cd5b2672c9a21bf00343ce22b8bdfeeed9aeaeb6ed5af12234e9678a7f086dab671e54a10f07c016a8ecc483184bbaee05044e361d4ad2d5fba93a85627019e26628cc723f456867021811819633c99f8dac3ec7f604055ccd02ed6690374f36e683ae51fe4ec7cdaa78ed6f4a89bd03a09cb36498f17008bf1c2cf91c16373b22971810f1d52c24f3016b15e7dc084ab768a8678082e3e6558b55957bfcd1d029a0948208133ce20d9f8a363cda7cc8f9633860f6f7f866bb33f5135b07010bd7c34b90180c66711523a6bb0cd495df23484287ea2e885f85458b7cfbf1d70885e602912e4a772e2fc1c5db61d30a5d6542d28160a39cdfeaee2afadafc06443408b9a2e1dc0295eb7d4e9117e1ef348d839e408d4c53ed8b79bf2bdb11fbd37b7ddd806d9c55bd0c89f006a7d639231ee2e15df4056fb0e9c761b537943341720db2024a7c0fb6aa1587ec61ca4459988dad5ba35e256a07db95c41ca3091e54f3fb027fe34ba98a86c9eb2fc559f7a9b55c2f61a1b414b6e458eec70a42879d86db905f376b684f3bae66c637e8a8ae8b84371b191150456676940f2c8b08807176b1b8f324c84106c2921600d5220e63c62d7e2a1cfda9e3151697cd4e331ee2c4c2ab056a9f7e9ead3ae1733edff89d4ce7746b9bf232510fe24879bbdb247b1a230159d58bc44f4a400fdc0f07edc4b08362997cecb7b9e9f1f7552a82d2f1be800eb47a45553ce999d6d8e9caca211fc392b651f26847eaf621decf8e83f91782adf8bd7ea61734dc62bad326ea25071a3c80d4dc327c9d5b0a809162d9dbf2c21c45278bd82518b50d126e751fbc3cd6b129867d795b107a667b425c6196f541457f751f66db0f09be5a40bcfed83d5ff898feabc98152abd39d8d6fc9003ff009b2bd61a225b1656fcbaac64e0783dfeba09494b3c87c1ae21a576f43a8c5714d1e5827a249014405de746cde911bf4f5f2ad8443981f90397eee92c94c2b429089f2eda26c51229bf13e136f1ab40a0044c673d367c30590e385b64eef9110cdb0a6858f759e65acffac51e78ec64c87585adbc7a05d66aa28c39ad492f6d0a7810643ff8a2a09d2d3ff472d0115015f77761a2bfe6fecad3b130b9e16100150a2b8bc2985e2a906d2995c83ff57bef534f3248f88abbb5a996246cfca6971459221b87ba6742192713670c015c360280c58d53831b4f9c1867bcafdbb1e6239f6cb23f7be6b06f81a6bc94041ee5bb101459d24a06122f76a42ed1b6086f";
	// bytes proof = abi.encodePacked(proofHexStr);

	function setUp() public {
		plonkVerifier = new UltraVerifier();
		radius = new Radius(plonkVerifier);
	}

	function test_RadiusCorrectInput() public {

		correctInputs[0] = _correctInput1;
		string memory proofStr = vm.readLine("./circuits-radius/proofs/radius.proof");
		bytes memory proof = vm.parseBytes(proofStr);

		bool result = radius.verifyDistance(proof, correctInputs);
		console.log("proof verified: ", result);
		assert(result);
	}

	function testFail_RadiusWrongInput() public {

		wrongInputs[0] = _wrongInput1;
		string memory proofStr = vm.readLine("./circuits-radius/proofs/radius.proof");
		bytes memory proof = vm.parseBytes(proofStr);

		bool result = radius.verifyDistance(proof, wrongInputs);
		console.log("proof verified: ", result);
		assert(result);
	}

	function test_DynamicProof() public {

		// vm.assume(0 < x1 && x1 < 10);

		string[] memory _fieldNames = new string[](5);
		string[] memory _fieldValues = new string[](5);

		_fieldNames[0] = "x1";
		_fieldNames[1] = "x2";
		_fieldNames[2] = "y1";
		_fieldNames[3] = "y2";
		_fieldNames[4] = "d";

		// _fieldValues[0] = string(abi.encode(x1));
		_fieldValues[0] = "1";
		_fieldValues[1] = "2";
		_fieldValues[2] = "3";
		_fieldValues[3] = "4";
		_fieldValues[4] = "49";

		bytes memory proofBytes = generateDynamicProof("test1", _fieldNames, _fieldValues);

		bytes32 _expectCorrectInput1 = 0x0000000000000000000000000000000000000000000000000000000000000031;
		bytes32[] memory expectCorrectInputs = new bytes32[](1);
		expectCorrectInputs[0] = _expectCorrectInput1;

		radius.verifyDistance(proofBytes, expectCorrectInputs);
	}


	function test_PlonkVK() public {

		correctInputs[0] = _correctInput1;
		string memory proofStr = vm.readLine("./circuits-radius/proofs/radius.proof");
		bytes memory proof = vm.parseBytes(proofStr);

		bool result = plonkVerifier.verify(proof, correctInputs);
		console.log("proof verified: ", result);
		assert(result);
	}

	// function testFuzz_SetNumber(uint256 x) public {
	//     counter.setNumber(x);
	//     assertEq(counter.number(), x);
	// }


  function generateDynamicProof(
	string memory _testName,
	string[] memory _fields,
	string[] memory _fieldValues
  ) public returns (bytes memory) {

	require(_fields.length == _fieldValues.length, "generateProof: Input arrays not the same length");

	string[] memory fileCreateCommand = new string[](2);
	fileCreateCommand[0] = "./script/createFile.sh";
	fileCreateCommand[1] = _testName;
	bytes memory fileCreatedResponse = vm.ffi(fileCreateCommand);
	console.log(string(fileCreatedResponse));

	string memory _file = string.concat("/tmp/aztec/", _testName, "/Prover.toml");
	vm.writeFile(_file, "");
	for (uint256 i; i < _fields.length; i++) {
		vm.writeLine(_file, string.concat(_fields[i], " = ", _fieldValues[i]));
	}

	// generate proof
	string[] memory ffi_command = new string[](2);
	ffi_command[0] = "./script/prove.sh";
	ffi_command[1] = _testName;
	bytes memory commandResponse = vm.ffi(ffi_command);
	console.log(string(commandResponse));
	string memory _newProof = vm.readLine(string.concat("/tmp/aztec/", _testName, "/proofs/radius.proof"));
	return vm.parseBytes(_newProof);
  }
}
