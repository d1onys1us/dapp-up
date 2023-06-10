<script lang="ts">
  import "@picocss/pico/css/pico.min.css";
  import { taiko } from "../domain/chain";
  import { baseGoerli, foundry, sepolia } from "viem/chains";
  import { ethereumClient, sepoliaClient, web3Modal } from "../stores";
  import { configureChains, createConfig } from "@wagmi/core";
  import { EthereumClient, w3mConnectors, w3mProvider } from "@web3modal/ethereum";
  import { Web3Modal } from "@web3modal/html";
  import { onMount } from "svelte";
  import { createPublicClient, http } from "viem";

  const projectId = import.meta.env.VITE_WEB3MODAL_PROJECT_ID;
  const chains = [baseGoerli, foundry, sepolia, taiko];

  onMount(async () => {
    const { publicClient } = configureChains(chains, [w3mProvider({ projectId })]);
    const wagmiConfig = createConfig({
      autoConnect: true,
      connectors: w3mConnectors({ projectId, version: 1, chains }),
      publicClient,
    });

    $ethereumClient = new EthereumClient(wagmiConfig, chains);
    $web3Modal = new Web3Modal({ projectId, defaultChain: sepolia }, $ethereumClient);

    // initialize viem clients
    $sepoliaClient = createPublicClient({
      chain: sepolia,
      transport: http(),
    });
  });
</script>

<header class="container">
  <nav>
    <ul>
      <li><a href="/">Home</a></li>
    </ul>
    <ul>
      <li><a href="/another-page">Another page</a></li>
      <li><w3m-network-switch /></li>
      <li>
        <w3m-core-button balance="hide" icon="hide" />
      </li>
    </ul>
  </nav>
</header>

<main class="container">
  <slot />
</main>
