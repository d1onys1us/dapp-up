<script lang="ts">
  // imports
  import { readContract, prepareWriteContract, writeContract } from "@wagmi/core";
  import { fooABI, fooAddress } from "../generated";
  import { foundry } from "@wagmi/core/chains";

  // variables
  let inputMessage = "";
  let messageFromContract = "";

  // functions
  async function readMessage() {
    const data = await readContract({
      address: fooAddress[foundry.id],
      abi: fooABI,
      functionName: "myString",
    });
    messageFromContract = data;
  }

  async function writeMessage() {
    const config = await prepareWriteContract({
      address: fooAddress[foundry.id],
      abi: fooABI,
      functionName: "setMyString",
      args: [inputMessage],
    });
    await writeContract(config);
    readMessage();
  }
</script>

<section>Note: Must be connected to local foundry (anvil) network.</section>
<section>
  <input type="submit" value="Read message" on:click={readMessage} />
  <div style="text-align: center">Message from contract: {messageFromContract}</div>
</section>
<section>
  <form>
    <input type="text" placeholder="Enter some text..." bind:value={inputMessage} />
    <input type="submit" value="Write" on:click={writeMessage} />
  </form>
</section>
