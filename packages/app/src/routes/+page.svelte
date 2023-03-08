<script>
  import ContractInteraction from "../components/ContractInteraction.svelte";
  import { providers, ethereumClient, wagmiClient, web3Modal } from "../stores";
  import { getProvider } from "@wagmi/core";

  // $providers["1"].getBlockNumber().then(console.log);
  // $providers["31337"].getBlockNumber().then(console.log);
  // $providers["167002"].getBlockNumber().then(console.log);

  const currentNetwork = $ethereumClient.getNetwork();
  if (currentNetwork.chain) {
    $providers[currentNetwork.chain.id].getBlockNumber().then(console.log);
  }
  // @ts-ignore
  console.log(getProvider());
</script>

{#if import.meta.env.MODE === "development"}
  <ContractInteraction />
{/if}
