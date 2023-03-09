<script>
  import ContractInteraction from "../components/ContractInteraction.svelte";
</script>

{#if import.meta.env.MODE === "development"}
  <ContractInteraction />
{/if}
