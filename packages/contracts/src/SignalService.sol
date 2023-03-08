import "forge-std/console.sol";
import {LibRLPWriter} from "./LibRLPWriter.sol";
import {LibBlockHeader, BlockHeader} from "./LibBlockHeader.sol";

pragma solidity ^0.8.18;

contract SignalService {
    using LibBlockHeader for BlockHeader;

    bytes proof = hex"0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000003609dba17f1c0b6cede82d9d9a1d5b252580ee6a295211a1fb8080e052ca59ca35b1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d493470000000000000000000000000000000000000000000000000000000000000000776370c4cb465070bb7f4fe9862f9e847fa9b3867150fe323f072852cf04846e3d698b1ff493e0b94ce2b2261136373b59110760ef3a98afc0d584f1158a72000ac2bea25d0b4d68261bb8912c318275a92e8fed136bbbb0bc83e7b29df7ead100800000000000000000000000000020000000020001000000000000000000000000000000000000000000040000000020000800000000000000100000200000000000000000000000000028000001004020000000000000000000000000000000100000000000000000004000000000000040000000000000000010000000100000400000000000000000010000000000000000000000000000004000000000020000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000010000000000000000010000000001000040000000000008000000020000008080000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002e89aa0000000000000000000000000000000000000000000000000000000001c9c380000000000000000000000000000000000000000000000000000000000001f65b000000000000000000000000000000000000000000000000000000006408fc0c00000000000000000000000000000000000000000000000000000000000002e04f294ced1fa3a777a3489004cefd9e4dbf58037ba27084559c2e4dd41adb6f64000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000019d883010b02846765746888676f312e32302e31856c696e7578000000000000000000000000000000000000000000000000000000000000000000000000000ca000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000b600000000000000000000000000000000000000000000000000000000000000af6f90af3b90214f90211a0c1c96527045c57df535c45bb59b562f0d7d38455dc365df067e9f70b6b082805a0d169e4e47cab56b4ebebcce7724f91b0570bcdb4ef241d291d2db262971e937ca073ce433a6e6a9ceedf0247ea06ad62fde4b58f6427522cb9691b1888f747f7e8a08fa09eab7884c76641c3602c4472485680febfe51ebcf971ce22a3c285b4b67ca0c615f7e116df36b51702c802dc98524bf8fff179ce1450f23bcb8f19406b2917a0f82614fdf0b7db41037819fd5ea4cf7e54491753cabd66cdccf09d77a32b0ef9a01111f1c38882ba74527edb332a83cbedb4fb82766da33db8ec9e6d9ea5a630c6a0621d1707202e3727868f127d27bad68b9987a69cbff1b54744e0c72b956ed31aa05000883090bd887ee987ca4a5242d1bda076bc33c51bb05c51ef68f6f4508100a00f96cef29518c33c34b1dab2061ae3926d6a739ed3e77a48fe06136b95a786bca08a6e876b5272f2be1ed39a456d7e32b33f005e546793f93f02acf77313a0c645a0e7c46660111a529b9c2a8d3fe3dc17df6443c71c5a33028d393a6055207ce380a07a04718836014208a51e0467b9431d284fdaed7d7786bd8e8307ec3956c69fe9a0ad21dbc93205eb4d8d86c72d4fa746856707afbfea15c5e5e8a7584cc5ba8294a0d1babd27f45cbeb1261b2587f93905d94daa7e4fdc97b1975f094f825ff5ff7fa00c5e447db466baab21b66e5ca31ac8e6865c7b672ac469ce46f4a70c0aa6009180b90214f90211a0a8008c542d25cf870457408b28e86a26a2d5a95a3fc09de228dcf81ef8c231e0a06f8b7cece4ce4c1c648841ee9f20d3a248b6e8fe32676d01e2be071470ed4a45a0bc4b973b4fe5dfef1847a489f939546f8e77ceefb4c23376d801ba11d8d4af3ba025e4e0a797a151519d553209f352acb3d1750eea8ddad2c4d377e3c6cad039f3a00894b6adcfd54dfd3479bceee84941ab66f940142572e408a765a78af12c2eada07263b4e0a76288a77ed5d20576b4b7966905a610cd832ba3cc279654ff095522a0e63615b0de1651224a802738c6b31a45a4b25000272f277de8db1226731ef400a009d5d939232a109c4e4e6d52fb0d5333b68fd53bdabbea1354fe6e20ac3ce2bfa07fb416ff9b9ee8dc150386713f1d6e816fd6625d6faeea503194b56926d44997a0b021b551483346e43223776bd9cbbe62f7e1a3c82506839b3d5afd775a715af3a0e17ef71d276c36cf02085e8e07436be0ed94f101b13f7753d35193c8f55a9175a0d374eb3b5ac9cccc2c2c241883fe66af9f001d8bbc2e93e10682b6ce374909dfa093c153b94622ecb3e42caed815c5e1d13ff68266008637d6a622f46808882d89a0115b03e33835a1fe581ce3bccb94b1e2429cf757f2a91a3a6fca3fa3549a30c0a0837bec3829b66fe267d9441f696992634264778d5338395576212dd56b65fef6a024a9269f9c9af6b40da3c0f2bad64d3b785b1840417bf3b49f56a935bb060a5980b90214f90211a023611cbaef286e1609ddb89081940c87d8908ad6b02201bdf2de4d438974ea1fa0a8d94d47d805084af59a6450f16b49616070fa0c8d2fa255280b63a90a447ef7a0caee51f86aedc78f26170ba7fb01781174578b930846a1f8013ad07ee4d23d8fa0b9005e5823600d853a244f1e6d33509cf785fc6c7c6d5d0d0c164fe7c8576833a00b85e95f66c0ec46b28775e2404833a881c0c993f17cc7623cfbaf39f26b79fba009095c6ac40ccac30d18498af2fae845f59ad414baf1e94583d4d62daaac0251a0b9be90049e60cf1b47c0642a19b37891bdcc0165437415821745a23ed8b47c3ba0349bab9f9415efd2313afda55b1265ddedec60c3ae58a0b79ee6f166812c06eca0879fddcf5d395022850eea6f87096757942d7ae7457b60f991cc45510241b6bda071c57173635fd9f5b682b601a990bcf4b976c587f4da5d23875ddf83916aed79a06b4a736b54da72eaf806c2399ba9f31abf2ade68105d7bc4b1a604f494dd8360a0e0899fb61d175c169930d522b7b49d1ad4f803cf8b55cf332224105424d3e490a0e7d09577f9230771de07b6be13bc6c48dc4fd051a641a24eb04a5de5605a0fe3a0e44d4260da367d54c3d90df55303d7fa37c6e2677d8688760130f48b9b10b3d4a04c2887443272bea926afc0524b90e0ef7c310533c79d87308034ff1c68ebad67a050ed1168bc51dd1ed8eea847e2f5a1f5e0d2d2c1c432b0ec6a3adf32740caafd80b90214f90211a06941da12ce3c0dbe524153ed09ed706f767707cf1c5baad22cdb9f96e71b6414a0e6997f1a8678409ca1220f9c309887e33941b27e22625febe1394be8a44cee3ba0d501e668dac7615b0c9ae5b2a9d9a4726bc2cac0a7d547b8ce280ec5fa4ced6da0719916c7b6c905d3de6f8d458a4e756a0ebf2c1736916ab7e78cbf0b4ef9da5ca0d7d9dd31d875f8b7ac552fb01d9de414cf900c287ac8ee8cfc62c4ca740af26ca0826c0d57da4b73e2255177aeb6d1efcb8ef1cba3aca61a1c06a716d8886acdaea0c2a6e9644076c32c9d101353ed552acfa9f7a2a9dd7c17dd15419463067ff651a07ad38df5eca626c0e62c0f6b74621a9794eab9e5a4548e3154d3ccab341c956fa0bba0938372279c2a465b1919619e2669311c20a4f115dc5424fcc5b7f351f0fda0dd8276738499753f499b2b1565eb595e423a12fa834ecc046e8b305fe080793ea09e9435bdc66ba92f9ab6310ca575e77c900ac2883d5d29c8b01978085a0e4fe1a0bae9459373266b4edc53f7563d4371965ee38058048f24ee92ef5a6375852226a0f81d5b33148bc7a9cbf537b86e63f6a4c149ee08addeb173ff9ea71f29fab6a6a0d74917f164a67aadfa4187ec2fcb00f0e150d7bbd2992803e2eeabcb538d540ba03536fae1ae27236be4b030f62d652311b2a0a5bd6cf7398f560296c038bc738aa07e5b75915268295f56182160dfee8916be59a552391fa560446efc295351e67980b90194f90191a01b8ca70274c51cc86bd0f9222a1ee0d60523edb16873a5df9609c8354da7923780a04e48c26ad0cd4cf06695c2e1c3aa9222509f9527d3301c6e5d1835d01a1753bea012c63d5737a21c1aa11f9e6431451fca980e96e115d6674c07574557114e819da0d63e7df254a2831e86c82d5824f13e4ab4df748579389f4a2010c34a7b3b8c18a03a6ff5933b8a128ce4e93f05585cfb37151a67846283b6d23d0082cbee4355b88080a0f4c27804cd8bae76a90c2d2cdcd02659f0bd1b8a8b4222c1a787a919c5723878a06821db048044d44db5ee56c98ea64bf7e1e8fc385166a1449b674b2759788d4680a0be5da70b5ccad0f6b24673bdae2cb0c1020b351573bd59d3f46a2eeaca6152bea0a4dd06caa3cd3c4142a690cc812f608c1a2eb0db2492a744151cfef30fdbbe86a087127f3091afc20dc23bcf14dbfdc8975660469eacf0025c55c2cdf34ecbff42a0f387564dd483e48bc85cbb6271518f931073321562c864b92b5b95311574f974a03ef14b0426271e56ef1f471e050ad488bde65acf603d41e6f33786b518a5022f80b893f891808080808080a01b01701006de6e7101322d84bc3cc5bd3056c5699e0d4b0c996a8175212b849c80a0afb9d56da595175068289a9c109c9920742727428a890c8aeeb97d80ed205369a057fabb5734a8918603567f3bbecfb039f0265fac78012307738571f4e3eb6bfd80808080a0dbcf6057f102b2c99903678b15f551bbcbfd8b157a12dbbb728628ae449d722c8080b869f8679e2091bc9220bc79c4f1f40d7863acf5024e97d8269c11e072d4427485c544b846f8440180a0422107b0ccec189204d08ebab597af2d400aef5466a575093310498d70752cf1a0941ac18e95797325e35f9ca46544a986743502b363dd79413964748a6ffc9b9900000000000000000000000000000000000000000000000000000000000000000000000000000000011cf90119b8f3f8f180a01825b56f423459c70657490c9cc87f4078dccbe527076961e4fc86e29cfe1bc7a04fc5f13ab2f9ba0c2da88b0151ab0e7cf4d85d08cca45ccd923c6ab76323eb28a03800e59d5e2a05988500d3259a57f353c7607ccf89408a6fb2de441ca750327580808080a06c047bdebd2f1f0042862aff3c08703152f5e3a95755a6881f87f2af4804ae228080a0f4984a11f61a2921456141df88de6e1a710d28681b91af794c5a721e47839cd780a0a66b8394078e1f63af16ece58be709ee25d4fdb256d826268d6f9cb89989df8fa062666132dd55d87631e45ca0f3f6dff35316aad71cf0a1e0d5bd2c282b466d528080a3e2a030f4592e049636e4a8cfd0f99e0f7cf4d6e3fcd1587a09295325c28abf72911b0100000000";

    struct SignalProof {
        BlockHeader header;
        bytes proof;
    }

    function getSignalProofValues(SignalProof memory sp) public view returns (bytes32, bytes memory) {
        return (sp.header.parentHash, sp.proof);
    }

    function isSignalReceived() public view returns (bool) {
        SignalProof memory sp = abi.decode(proof, (SignalProof));
        (bytes memory accountProof, bytes memory storageProof) = abi.decode(
            sp.proof,
            (bytes, bytes)
        );
        // console.logBytes(accountProof);
        // console.logBytes(storageProof);
        console.logUint(sp.header.height);
        console.logBytes32(sp.header.hashBlockHeader());
        //console.logBytes32(sp.header.receiptsRoot);

    }
}