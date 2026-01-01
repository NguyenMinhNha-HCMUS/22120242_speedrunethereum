# SpeedRunEthereum Challenges
Họ và tên: Nguyễn Minh Nhã

MSSV: 22120242

## Hướng dẫn Cài đặt và Chạy

### Yêu cầu hệ thống
Cần cài đặt:
- Node (>= v20.18.3)
- Yarn (v1 or v2+)
- Git

### Cách chạy code

1. **Clone repository**:
```bash
git clone <repository-url>
cd 22120242_speedrunethereum
```

2. **Chọn challenge muốn chạy**:
```bash
cd <tên challenge muốn chạy>
```
Lưu ý rằng hiện tại các contract chạy trên localhost, nếu muốn thay đổi cần làm theo các bước sau:
- Chỉnh `defaultNetwork` trong `packages/hardhat/hardhat.config.ts` thành mạng testnet ta muốn (ví dụ: sepolia).
- Trong `packages/nextjs/scaffold.config.ts`, ta chỉnh `targetNetwork` thành `chains.<tên mạng testnet>`(ví dụ: sepolia)

3. **Cài đặt dependencies**:
```bash
yarn install
```

4. **Chạy local blockchain** (Terminal 1):
```bash
yarn chain
```

5. **Deploy contracts** (Terminal 2):
```bash
yarn deploy
```

6. **Chạy frontend** (Terminal 3):
```bash
yarn start
```

Frontend sẽ chạy tại: http://localhost:3000
Tuy nhiên theo nội dung challenge, một số đoạn sẽ code cứng địa chỉ ví của Owner, khiến cho việc chạy front-end gặp lỗi. Thay vào test thủ công, ta có thể kiểm tra tính đúng đắn của challenge thông qua lệnh test như sau.
## Chạy Tests
Lưu ý, đảm bảo đã chạy `yarn install` trước khi test.
```bash
cd <tên thư mục challenge>
yarn test
```
Màn hình terminal sẽ hiện kết quả test.