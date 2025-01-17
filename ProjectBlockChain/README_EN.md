# CrossChain Swap Smart Contract

## 프로젝트 설명
이 프로젝트는 이더리움 네트워크 상에서 Anyswap 프로토콜을 활용한 크로스체인 자산 스왑(Cross-chain asset swap) 기능을 구현하는 스마트 계약입니다. 사용자는 설정된 **가스비 임계값(gas price threshold)**을 기준으로 자산을 다른 블록체인 네트워크로 자동으로 스왑할 수 있습니다.

스마트 계약은 사용자가 원하는 자산을, 가스비가 높은 시점에서 다른 체인으로 스왑하여 비용을 절감할 수 있도록 설계되었습니다.


## 주요 기능
- **가스비 임계값 설정**: 스마트 계약은 **트랜잭션의 가스비**가 설정된 **임계값(gasThreshold)**을 초과할 때 자산 스왑을 실행합니다. (`function checkGasAndSwap`)
- **크로스체인 자산 스왑**: Anyswap 프로토콜을 사용하여 자산을 다른 체인으로 스왑합니다. (`function anySwapOut`)
- **소유자 권한**: 계약 소유자는 가스비 임계값을 변경할 수 있습니다. (`function updateGasThreshold`)

## 기술스텍
- solidity 0.8.0
- Truffle v5.4.X
- Ganaghe
- Anyswap Protocol
- Node.js v14.X


### 설치 및 실행 방법

1. 프로젝트 클론 및 의존성 설치

먼저 이 저장소를 클론한 후, 필요한 Node.js 의존성 패키지를 설치합니다

```
git clone https://github.com/your-repo/cross-chain-swap.git
cd cross-chain-swap
npm install
```


2. Ganache 실행

Ganache를 사용해 로컬 개발 환경을 실행합니다. Ganache를 실행하면, 기본적으로 127.0.0.1:8545에서 RPC 서버가 실행됩니다.

```
ganache-cli --networkId 1337
```


3. Truffle로 스마트 계약 배포

Ganache가 실행된 상태에서 Truffle을 사용해 스마트 계약을 로컬 블록체인 네트워크에 배포합니다.

```
truffle migrate --network development
```




###스마트 계약 설명

1. CrossSwapContrat.sol

이 스마트 계약은 다음과 같은 핵심 기능을 제공합니다:

- 가스비 임계값 체크 및 자산 스왑: 가스비가 설정된 임계값을 넘으면 Anyswap 프로토콜을 사용해 자산을 스왑합니다.
- 소유자 기능: 스마트 계약의 소유자만이 가스비 임계값을 업데이트할 수 있는 기능을 포함하고 있습니다.
- 이벤트 트리거: 가스비가 임계값을 넘었을 때 GasPriceHigh 이벤트가 발생하여 트랜잭션을 기록합니다.

2. 배포 스크립트: 2_deploy_contracts.js

이 파일은 Anyswap 주소와 가스비 임계값을 설정한 후 스마트 계약을 배포하는 역할을 합니다. 배포 과정에서 Anyswap 프로토콜과 연결하여 크로스체인 자산 스왑 기능을 활성화합니다.
