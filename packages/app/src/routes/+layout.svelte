<script lang="ts">
  import "@picocss/pico/css/pico.min.css";
  import { taiko } from "../domain/chain";
  import { ethereumClient, wagmiClient, web3Modal, providers } from "../stores";
  import { configureChains, createClient } from "@wagmi/core";
  import { sepolia, foundry } from "@wagmi/core/chains";
  import { EthereumClient, w3mConnectors } from "@web3modal/ethereum";
  import { Web3Modal } from "@web3modal/html";
  import { ethers } from "ethers";
  import { jsonRpcProvider } from "@wagmi/core/providers/jsonRpc";

  const projectId = import.meta.env.VITE_WEB3MODAL_PROJECT_ID;

  $providers = {
    [sepolia.id]: new ethers.providers.JsonRpcProvider("https://rpc.sepolia.org"),
    [taiko.id]: new ethers.providers.JsonRpcProvider("https://l2rpc.hackathon.taiko.xyz"),
    [foundry.id]: new ethers.providers.JsonRpcProvider("http://localhost:8545"),
  };
  const { chains, provider } = configureChains(
    [sepolia, taiko, foundry],
    [
      jsonRpcProvider({
        rpc: (chain) => ({ http: $providers[chain.id].connection.url }),
      }),
    ]
  );

  // @ts-ignore
  $wagmiClient = createClient({
    autoConnect: true,
    connectors: w3mConnectors({ chains, version: 1, projectId }),
    provider,
  });
  $ethereumClient = new EthereumClient($wagmiClient, chains);
  $web3Modal = new Web3Modal({ projectId, defaultChain: sepolia }, $ethereumClient);
</script>

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

<main class="container">
  <slot />
</main>
