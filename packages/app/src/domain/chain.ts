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
  id: 167001,
  name: "Taiko",
  network: "alpha-3",
  nativeCurrency: {
    name: "Taiko Ether",
    symbol: "ETH",
    decimals: 18,
  },
  rpcUrls: {
    public: {
      http: ["https://rpc.test.taiko.xyz"],
    },
    default: {
      http: ["https://rpc.test.taiko.xyz"],
    },
  },
  blockExplorers: {
    default: {
      name: "L2 Explorer",
      url: "https://explorer.test.taiko.xyz",
    },
  },
  testnet: true,
} as const satisfies Chain;
