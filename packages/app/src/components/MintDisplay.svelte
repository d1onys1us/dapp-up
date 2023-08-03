<script lang="ts">
  import { getAccount } from "@wagmi/core";

  import { queryStore, gql, getContextClient } from "@urql/svelte";

  let { address: owner } = getAccount();

  export const diamonds = queryStore({
    client: getContextClient(),
    query: gql`
      query GetDiamondNFTOwners($owner: String) {
        tokens(where: { owner: $owner }) {
          id
          uri
        }
      }
    `,
    variables: { owner: owner?.toLocaleLowerCase() },
  });
</script>

<section>
  <h3>NFT Inventory</h3>
  {#if $diamonds.fetching}
    <p>Loading...</p>
  {:else if $diamonds.error}
    <p>Oh no... {$diamonds.error.message}</p>
  {:else if $diamonds.data.tokens.length === 0}
    No NFTs Minted
  {:else}
    <ul>
      {#each $diamonds.data.tokens as diamond}
        <img src={diamond.uri} alt="diamond" />
      {/each}
    </ul>
  {/if}
</section>

<style>
  img {
    width: 100px;
    height: 100px;
  }
</style>
