<script lang="ts">
  import "@picocss/pico/css/pico.min.css";
  import { base, taiko } from "../domain/chain";
  import { ethereumClient, wagmiClient, web3Modal } from "../stores";
  import { configureChains, createClient } from "@wagmi/core";
  import { mainnet, goerli, sepolia, foundry } from "@wagmi/core/chains";
  import { EthereumClient, modalConnectors, walletConnectProvider } from "@web3modal/ethereum";
  import { Web3Modal } from "@web3modal/html";

  const projectId = import.meta.env.VITE_WEB3MODAL_PROJECT_ID;
  const chains = [mainnet, goerli, sepolia, foundry, base, taiko];
  const connectors = modalConnectors({ projectId, appName: "web3Modal", chains });
  const { provider } = configureChains(chains, [walletConnectProvider({ projectId })]);

  // @ts-ignore TODO: fix this
  $wagmiClient = createClient({
    autoConnect: true,
    connectors,
    provider,
  });
  $ethereumClient = new EthereumClient($wagmiClient, chains);
  $web3Modal = new Web3Modal(
    { projectId, defaultChain: import.meta.env.MODE === "development" ? foundry : mainnet },
    $ethereumClient
  );
</script>

<!-- Header -->
<header class="container">
  <nav>
    <ul>
      <li><a href="/">Home</a></li>
    </ul>
    <ul>
      <li><a href="/another-page">Another page</a></li>
      <li><w3m-network-switch /></li>
      <li><w3m-core-button balance="show" icon="hide" /></li>
    </ul>
  </nav>
</header>

<!-- Main -->
<main class="container">
  <slot />
</main>

<!-- Footer -->
<footer class="container">A footer</footer>
