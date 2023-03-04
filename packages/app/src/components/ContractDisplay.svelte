<script lang="ts">
  import { onMount } from "svelte";
  import { readFoo, prepareWriteFoo, writeFoo } from "../generated";

  // variables
  let inputMessage = "";
  let messageFromContract = "";

  // functions
  async function readMessage() {
    messageFromContract = await readFoo({
      functionName: "myString",
    });
  }

  async function writeMessage() {
    const config = await prepareWriteFoo({
      functionName: "setMyString",
      args: [inputMessage],
    });
    await writeFoo(config);
    readMessage();
  }

  onMount(readMessage);
</script>

<div>
  <h3>Message from contract: {messageFromContract}</h3>
</div>
<br />
<div>
  <div class="form-control">
    <div class="input-group">
      <input
        type="text"
        bind:value={inputMessage}
        placeholder="Enter some text..."
        class="input input-bordered"
      />
      <button class="btn" on:click={writeMessage}>WRITE</button>
    </div>
  </div>
</div>
