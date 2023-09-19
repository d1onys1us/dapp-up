import type { Chain } from "viem/chains";

export const taiko = {
  id: 167007,
  name: "Taiko",
  network: "alpha-5",
  nativeCurrency: {
    name: "Ether",
    symbol: "ETH",
    decimals: 18,
  },
  rpcUrls: {
    public: {
      http: ["https://rpc.jolnir.taiko.xyz"],
    },
    default: {
      http: ["https://rpc.jolnir.taiko.xyz"],
    },
  },
  blockExplorers: {
    default: {
      name: "blockscout",
      url: "https://explorer.jolnir.taiko.xyz",
    },
  },
  testnet: true,
} as const satisfies Chain;
