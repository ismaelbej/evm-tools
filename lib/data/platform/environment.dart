const String infuraKey = String.fromEnvironment('INFURA_KEY', defaultValue: '');

const String rpcUrl = "https://mainnet.infura.io/v3/$infuraKey";
const String wsUrl = "wss://mainnet.infura.io/ws/v3/$infuraKey";
