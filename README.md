# SpeedRunEthereum Challenges

Bộ sưu tập các bài làm challenges từ [SpeedRunEthereum](https://speedrunethereum.com/)

## 📚 Danh sách Challenges

1. **Challenge 1 - Decentralized Staking**: Staking contract với reward mechanism
2. **Challenge 2 - Token Vendor**: Token sale và vendor contract  
3. **Challenge 3 - Dice Game**: On-chain dice game với randomness
4. **Challenge 4 - DEX**: Decentralized Exchange (AMM)
5. **Challenge 5 - Over-Collateralized Lending**: Lending protocol
6. **Challenge 6 - Stablecoins**: Stablecoin system

## 🏗 Cấu trúc Project

Mỗi challenge là một Scaffold-ETH 2 project với:
```
challengeX-name/
├── packages/
│   ├── hardhat/          # Smart contracts
│   │   ├── contracts/    # Solidity contracts
│   │   ├── deploy/       # Deployment scripts
│   │   └── test/         # Unit tests
│   └── nextjs/           # Frontend
│       ├── app/          # Next.js pages
│       └── components/   # React components
```

## 🚀 Hướng dẫn Cài đặt và Chạy

### Yêu cầu hệ thống
- Node.js >= 18
- Yarn package manager
- Git

### Cài đặt một challenge

1. **Clone repository**:
```bash
git clone <repository-url>
cd my-speedrun-challenges
```

2. **Chọn challenge muốn chạy**:
```bash
cd challenge1-decentralized-staking
```

3. **Cài đặt dependencies**:
```bash
yarn install
```

4. **Copy environment file**:
```bash
cp packages/hardhat/.env.example packages/hardhat/.env
```

5. **Chạy local blockchain** (Terminal 1):
```bash
yarn chain
```

6. **Deploy contracts** (Terminal 2):
```bash
yarn deploy
```

7. **Chạy frontend** (Terminal 3):
```bash
yarn start
```

Frontend sẽ chạy tại: http://localhost:3000

## 🧪 Chạy Tests

```bash
cd challengeX-name
yarn hardhat:test
```

## 📝 Lưu ý Quan trọng

⚠️ **BẢO MẬT**: 
- KHÔNG bao giờ commit file `.env` chứa private keys lên GitHub
- Chỉ push `.env.example` làm template

📖 **Hướng dẫn chi tiết**: Mỗi challenge có thể có README riêng trong thư mục của nó

## 🔗 Tài nguyên Tham khảo

- [SpeedRunEthereum](https://speedrunethereum.com/)
- [Scaffold-ETH 2 Docs](https://docs.scaffoldeth.io/)
- [Hardhat Documentation](https://hardhat.org/)
- [Solidity Documentation](https://docs.soliditylang.org/)

## 📄 License

MIT License - Dùng tự do cho mục đích học tập
