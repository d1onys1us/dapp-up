<script lang="ts">
  import { configureChains, createClient } from "@wagmi/core";
  import { mainnet, polygon, goerli, sepolia } from "@wagmi/core/chains";
  import { taiko, anvil, base } from "./domain/chain";
  import { Web3Modal } from "@web3modal/html";
  import {
    EthereumClient,
    modalConnectors,
    walletConnectProvider,
  } from "@web3modal/ethereum";
  import { wagmiClient } from "./store/wagmi";
  import { ethereumClient } from "./store/ethereumClient";
  import { web3modal } from "./store/web3modal";
  import Home from "./pages/Home.svelte";
  import NotHome from "./pages/NotHome.svelte";
  import Router, { link } from "svelte-spa-router";

  const projectId = import.meta.env.VITE_WEB3MODAL_PROJECT_ID;
  const chains = [mainnet, polygon, goerli, sepolia, taiko, anvil, base];
  const { provider } = configureChains(chains, [
    walletConnectProvider({ projectId }),
  ]);

  // Global store instances
  $wagmiClient = createClient({
    autoConnect: true,
    connectors: modalConnectors({
      projectId,
      version: "2",
      appName: "web3Modal",
      chains,
    }),
    provider,
  });
  $ethereumClient = new EthereumClient($wagmiClient, chains);
  $web3modal = new Web3Modal({ projectId }, $ethereumClient);

  // Define page routes
  const routes = {
    "/": Home,
    "/not-home": NotHome,
  };
</script>

<header>
  <nav>
    <li>
      <a href="/" use:link>Create L2 Stack</a>
    </li>
    <ul>
      <li>
        <a href="/" use:link>Home</a>
      </li>
      <li>
        <a href="/not-home" use:link>Not Home</a>
      </li>
      <li>
        <w3m-network-switch />
      </li>
      <li>
        <w3m-core-button balance="show" icon="hide" />
      </li>
    </ul>
  </nav>
</header>

<main>
  <Router {routes} />
</main>
