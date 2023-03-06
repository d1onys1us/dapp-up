import type { Chain } from "@wagmi/core";

export const base = {
    id: 84531,
    name: "Base",
    network: "Base Goerli",
    nativeCurrency: {
      decimals: 18,
      name: "Ether",
      symbol: "ETH",
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
  network: "Askja (Alpha-2)",
  nativeCurrency: {
    decimals: 18,
    name: "Ether",
    symbol: "ETH",
  },
  rpcUrls: {
    public: {
      http: ["https://l2rpc.a2.taiko.xyz"],
    },
    default: {
      http: ["https://l2rpc.a2.taiko.xyz"],
    },
  },
  blockExplorers: {
    default: {
      name: "L2 Explorer",
      url: "https://l2explorer.a2.taiko.xyz",
    },
  },
} as const satisfies Chain;

