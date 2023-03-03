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

  // todo: make this load from a store?
  $wagmiClient.provider.getNetwork().then((network) => {
    console.log("found a chainID:", network.chainId);
  });

  // define page routes
  const routes = {
    "/": Home,
    "/not-home": NotHome,
  };
</script>

<main>
  <div class="container mx-auto flex flex-col h-screen px-64">
    <div class="navbar bg-base-100">
      <div class="flex-none">
        <a href="/" class="btn btn-ghost normal-case text-xl">L2 Dapp</a>
      </div>
      <div class="flex-none">
        <a href="/" use:link class="btn btn-ghost normal-case">Home</a>
      </div>
      <div class="flex-none">
        <a href="/not-home" use:link class="btn btn-ghost normal-case"
          >Not Home</a
        >
      </div>
      <div class="flex-1" />
      <div class="flex-none gap-2">
        <w3m-network-switch />
        <w3m-core-button balance="show" icon="hide" />
      </div>
    </div>
    <!-- Start main -->
    <main class="flex flex items-center justify-center h-screen">
      <div class="grid grid-cols-1">
        <Router {routes} />
      </div>
    </main>
    <!-- End main -->
    <footer class="footer footer-center p-4 bg-base-300 text-base-content">
      <div>
        <p>Made with ❤️‍🔥 for buidlers</p>
      </div>
    </footer>
  </div>
</main>
