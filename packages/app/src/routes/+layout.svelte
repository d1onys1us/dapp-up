<script lang="ts">
  import "@picocss/pico/css/pico.min.css";
  import { taiko } from "../domain/chain";
  import { ethereumClient, wagmiClient, web3Modal, providers } from "../stores";
  import { configureChains, createClient } from "@wagmi/core";
  import { sepolia } from "@wagmi/core/chains";
  import { EthereumClient, modalConnectors } from "@web3modal/ethereum";
  import { Web3Modal } from "@web3modal/html";
  import { ethers } from "ethers";
  import { jsonRpcProvider } from "@wagmi/core/providers/jsonRpc";

  const projectId = import.meta.env.VITE_WEB3MODAL_PROJECT_ID;

  $providers = {
    [sepolia.id]: new ethers.providers.JsonRpcProvider(import.meta.env.VITE_SEPOLIA_RPC),
    [taiko.id]: new ethers.providers.JsonRpcProvider(import.meta.env.VITE_TAIKO_RPC),
  };
  const { chains, provider } = configureChains(
    [sepolia, taiko],
    [
      jsonRpcProvider({
        rpc: (chain) => ({ http: $providers[chain.id].connection.url }),
      }),
    ]
  );
  const connectors = modalConnectors({ projectId, appName: "web3Modal", chains });

  // @ts-ignore
  $wagmiClient = createClient({
    autoConnect: true,
    connectors,
    provider,
  });
  $ethereumClient = new EthereumClient($wagmiClient, chains);
  $web3Modal = new Web3Modal({ projectId, defaultChain: sepolia }, $ethereumClient);
</script>

<!-- Header -->
<header class="container">
  <nav>
    <ul>
      <li><a href="/">Home</a></li>
    </ul>
    <ul>
      <li><a href="/signal-service">Signal service</a></li>
      <li><w3m-network-switch /></li>
      <li>
        <w3m-core-button balance="show" icon="hide" />
      </li>
    </ul>
  </nav>
</header>

<!-- Main -->
<main class="container">
  <slot />
</main>

<!-- Footer -->
<!-- <footer class="container">A footer</footer> -->
