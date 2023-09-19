<script lang="ts">
  import { prepareWriteContract, writeContract } from "@wagmi/core";
  import { diamondsABI, diamondsAddress } from "../generated";
  import { foundry } from "viem/chains";
  import { ethereumClient } from "../stores";

  async function writeMessage() {
    // get current chain id
    const chainId = $ethereumClient.getNetwork().chain?.id ?? foundry.id;

    const config = await prepareWriteContract({
      address: diamondsAddress[(chainId as 31337) || 84531 || 167007],
      abi: diamondsABI,
      functionName: "mint",
      args: [BigInt(1)],
      value: BigInt(0),
    });
    await writeContract(config.request);
    // readMessage();
  }
</script>

<section>
  <h3>Mint an NFT</h3>
  <form>
    <input type="submit" value="Mint NFT" on:click={writeMessage} />
  </form>
</section>
