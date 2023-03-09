<script>
  import ContractInteraction from "../components/ContractInteraction.svelte";
</script>

{#if import.meta.env.MODE === "development"}
  <ContractInteraction />
{:else}
  <h3>Just a home page.</h3>
{/if}
