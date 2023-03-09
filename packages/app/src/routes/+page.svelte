<script>
  import ContractInteraction from "../components/ContractInteraction.svelte";
</script>

{#if import.meta.env.MODE === "development"}
  <ContractInteraction />
{:else}
  <h1>Just a home page.</h1>
{/if}
