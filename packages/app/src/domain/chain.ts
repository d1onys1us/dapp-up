import type { Chain } from "@wagmi/core";

export const base = {
  id: 84531,
  name: "Base",
  network: "Base Goerli",
  nativeCurrency: {
    name: "Ether",
    symbol: "ETH",
    decimals: 18,
  },
  rpcUrls: {
    public: {
      http: ["https://goerli.base.org"],
    },
    default: {
      http: ["https://goerli.base.org"],
    },
  },
} as const satisfies Chain;

export const taiko = {
  id: 167002,
  name: "Taiko",
  network: "askja",
  nativeCurrency: {
    name: "Taiko Ether",
    symbol: "ETH",
    decimals: 18,
  },
  // TODO: this is a duplication to the layout.svelte rpc, make DRY from env vars
  rpcUrls: {
    public: {
      http: ["https://l2rpc.hackathon.taiko.xyz"],
    },
    default: {
      http: ["https://l2rpc.hackathon.taiko.xyz"],
    },
  },
  blockExplorers: {
    default: {
      name: "L2 Explorer",
      url: "https://l2explorer.hackathon.taiko.xyz",
    },
  },
  testnet: true,
} as const satisfies Chain;
