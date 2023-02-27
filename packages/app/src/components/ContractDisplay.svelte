<script lang="ts">
  // imports
  import {
    readContract,
    prepareWriteContract,
    writeContract,
  } from "@wagmi/core";
  import { onMount } from "svelte";
  import { fooABI } from "../out/generated";

  // variables
  let inputMessage = "";
  let messageFromContract = "";
  const fooAddress = import.meta.env.VITE_FOO_ADDRESS;

  // functions
  async function readMessage() {
    const data = await readContract({
      address: fooAddress,
      abi: fooABI,
      functionName: "myString",
    });
    messageFromContract = data;
  }

  async function writeMessage() {
    const config = await prepareWriteContract({
      address: fooAddress,
      abi: fooABI,
      functionName: "setMyString",
      args: [inputMessage],
    });
    await writeContract(config);
    readMessage();
  }

  onMount(readMessage);
</script>

<h3>Message from contract: {messageFromContract}</h3>
<form>
  <input
    type="text"
    bind:value={inputMessage}
    placeholder="Enter some text..."
  />
  <input type="submit" value="Write" on:click={writeMessage} />
</form>
