# System hook money into tokenized asset
# Staking contract
# Redeem token
# Get USDC out -> turn into real world asset

# Launch a contract on EVM main net
# keep track how long a token each person hold off
# Once lanunch, migrate all these record of token to person.

# Just forge build the contract to make sure the functionality.


# Requirement/Features:
1. Take people's deposit on Ethereum and calcluate how much can they reward
2. Once mainnet is available, migrate all these record into mainnet. 
3. How to make sure User can easily migration (Redeem deposit on mainnet)

# Functions:
1. User deposit function (USDC)
2. User redeem function (USDC)
3. Migrate records to Eth Mainnet and #3 above.

Example:
Users - 1,000,000 on mainnet contract
How to intergrate them to Plume mainnet?

# Sudo:
1. mapping (address => uint256) userToAmount;
2. 