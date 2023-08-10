import { Client, cacheExchange, fetchExchange } from '@urql/svelte';

const API_URL = 'http://43.153.69.251:8000/subgraphs/name/taiko/diamondsNFT'

export const client = new Client({
    url: API_URL,
    exchanges: [cacheExchange, fetchExchange],
});
