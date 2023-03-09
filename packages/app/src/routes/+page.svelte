<script>
  import ContractInteraction from "../components/ContractInteraction.svelte";
  import { providers, ethereumClient, web3Modal } from "../stores";
  import { getProvider } from "@wagmi/core";

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
