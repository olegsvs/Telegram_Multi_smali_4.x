.class public Lorg/telegram/messenger/voip/VoIPService;
.super Landroid/app/Service;
.source "VoIPService.java"

# interfaces
.implements Lorg/telegram/messenger/voip/VoIPController$ConnectionStateListener;
.implements Landroid/hardware/SensorEventListener;
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;
.implements Lorg/telegram/messenger/NotificationCenter$NotificationCenterDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/telegram/messenger/voip/VoIPService$StateListener;
    }
.end annotation


# static fields
.field public static final ACTION_HEADSET_PLUG:Ljava/lang/String; = "android.intent.action.HEADSET_PLUG"

.field private static final CALL_MAX_LAYER:I = 0x41

.field private static final CALL_MIN_LAYER:I = 0x41

.field public static final DISCARD_REASON_DISCONNECT:I = 0x2

.field public static final DISCARD_REASON_HANGUP:I = 0x1

.field public static final DISCARD_REASON_LINE_BUSY:I = 0x4

.field public static final DISCARD_REASON_MISSED:I = 0x3

.field private static final ID_INCOMING_CALL_NOTIFICATION:I = 0xca

.field private static final ID_ONGOING_CALL_NOTIFICATION:I = 0xc9

.field private static final PROXIMITY_SCREEN_OFF_WAKE_LOCK:I = 0x20

.field public static final STATE_BUSY:I = 0x11

.field public static final STATE_ENDED:I = 0xb

.field public static final STATE_ESTABLISHED:I = 0x3

.field public static final STATE_EXCHANGING_KEYS:I = 0xc

.field public static final STATE_FAILED:I = 0x4

.field public static final STATE_HANGING_UP:I = 0xa

.field public static final STATE_RECONNECTING:I = 0x5

.field public static final STATE_REQUESTING:I = 0xe

.field public static final STATE_RINGING:I = 0x10

.field public static final STATE_WAITING:I = 0xd

.field public static final STATE_WAITING_INCOMING:I = 0xf

.field public static final STATE_WAIT_INIT:I = 0x1

.field public static final STATE_WAIT_INIT_ACK:I = 0x2

.field private static final TAG:Ljava/lang/String; = "tg-voip-service"

.field public static callIShouldHavePutIntoIntent:Lorg/telegram/tgnet/TLRPC$PhoneCall;

.field private static sharedInstance:Lorg/telegram/messenger/voip/VoIPService;


# instance fields
.field private a_or_b:[B

.field private afterSoundRunnable:Ljava/lang/Runnable;

.field private authKey:[B

.field private btAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

.field private callReqId:I

.field private controller:Lorg/telegram/messenger/voip/VoIPController;

.field private controllerStarted:Z

.field private cpuWakelock:Landroid/os/PowerManager$WakeLock;

.field private currentState:I

.field private endCallAfterRequest:Z

.field private endHash:I

.field private g_a:[B

.field private g_a_hash:[B

.field private haveAudioFocus:Z

.field private isBtHeadsetConnected:Z

.field private isHeadsetPlugged:Z

.field private isOutgoing:Z

.field private isProximityNear:Z

.field private keyFingerprint:J

.field private lastError:I

.field private lastKnownDuration:J

.field private lastNetInfo:Landroid/net/NetworkInfo;

.field private mHasEarpiece:Ljava/lang/Boolean;

.field private micMute:Z

.field private needPlayEndSound:Z

.field private needSendDebugLog:Z

.field private ongoingCallNotification:Landroid/app/Notification;

.field private pendingUpdates:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/telegram/tgnet/TLRPC$PhoneCall;",
            ">;"
        }
    .end annotation
.end field

.field private playingSound:Z

.field private prevStats:Lorg/telegram/messenger/voip/VoIPController$Stats;

.field private proximityWakelock:Landroid/os/PowerManager$WakeLock;

.field private receiver:Landroid/content/BroadcastReceiver;

.field private ringtonePlayer:Landroid/media/MediaPlayer;

.field private soundPool:Landroid/media/SoundPool;

.field private spBusyId:I

.field private spConnectingId:I

.field private spEndId:I

.field private spFailedID:I

.field private spPlayID:I

.field private spRingbackID:I

.field private stateListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/telegram/messenger/voip/VoIPService$StateListener;",
            ">;"
        }
    .end annotation
.end field

.field private stats:Lorg/telegram/messenger/voip/VoIPController$Stats;

.field private timeoutRunnable:Ljava/lang/Runnable;

.field private user:Lorg/telegram/tgnet/TLRPC$User;

.field private userID:I

.field private vibrator:Landroid/os/Vibrator;

.field private wasEstablished:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 90
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 128
    iput v2, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    .line 146
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->stateListeners:Ljava/util/ArrayList;

    .line 158
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/telegram/messenger/voip/VoIPService;->lastKnownDuration:J

    .line 159
    new-instance v0, Lorg/telegram/messenger/voip/VoIPController$Stats;

    invoke-direct {v0}, Lorg/telegram/messenger/voip/VoIPController$Stats;-><init>()V

    iput-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->stats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    new-instance v0, Lorg/telegram/messenger/voip/VoIPController$Stats;

    invoke-direct {v0}, Lorg/telegram/messenger/voip/VoIPController$Stats;-><init>()V

    iput-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->prevStats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    .line 161
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->mHasEarpiece:Ljava/lang/Boolean;

    .line 164
    iput-boolean v2, p0, Lorg/telegram/messenger/voip/VoIPService;->needSendDebugLog:Z

    .line 165
    iput-boolean v2, p0, Lorg/telegram/messenger/voip/VoIPService;->endCallAfterRequest:Z

    .line 167
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->pendingUpdates:Ljava/util/ArrayList;

    .line 168
    new-instance v0, Lorg/telegram/messenger/voip/VoIPService$1;

    invoke-direct {v0, p0}, Lorg/telegram/messenger/voip/VoIPService$1;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    iput-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->afterSoundRunnable:Ljava/lang/Runnable;

    .line 180
    new-instance v0, Lorg/telegram/messenger/voip/VoIPService$2;

    invoke-direct {v0, p0}, Lorg/telegram/messenger/voip/VoIPService$2;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    iput-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->receiver:Landroid/content/BroadcastReceiver;

    .line 1629
    return-void
.end method

.method static synthetic access$000(Lorg/telegram/messenger/voip/VoIPService;)Landroid/media/SoundPool;
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    return-object v0
.end method

.method static synthetic access$100(Lorg/telegram/messenger/voip/VoIPService;)Z
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->isBtHeadsetConnected:Z

    return v0
.end method

.method static synthetic access$1002(Lorg/telegram/messenger/voip/VoIPService;I)I
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;
    .param p1, "x1"    # I

    .prologue
    .line 90
    iput p1, p0, Lorg/telegram/messenger/voip/VoIPService;->callReqId:I

    return p1
.end method

.method static synthetic access$1100(Lorg/telegram/messenger/voip/VoIPService;)V
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->callFailed()V

    return-void
.end method

.method static synthetic access$1200(Lorg/telegram/messenger/voip/VoIPService;)Lorg/telegram/tgnet/TLRPC$User;
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    return-object v0
.end method

.method static synthetic access$1302(Lorg/telegram/messenger/voip/VoIPService;[B)[B
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;
    .param p1, "x1"    # [B

    .prologue
    .line 90
    iput-object p1, p0, Lorg/telegram/messenger/voip/VoIPService;->g_a:[B

    return-object p1
.end method

.method static synthetic access$1400(Lorg/telegram/messenger/voip/VoIPService;)Lorg/telegram/tgnet/TLRPC$PhoneCall;
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    return-object v0
.end method

.method static synthetic access$1402(Lorg/telegram/messenger/voip/VoIPService;Lorg/telegram/tgnet/TLRPC$PhoneCall;)Lorg/telegram/tgnet/TLRPC$PhoneCall;
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;
    .param p1, "x1"    # Lorg/telegram/tgnet/TLRPC$PhoneCall;

    .prologue
    .line 90
    iput-object p1, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    return-object p1
.end method

.method static synthetic access$1502(Lorg/telegram/messenger/voip/VoIPService;[B)[B
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;
    .param p1, "x1"    # [B

    .prologue
    .line 90
    iput-object p1, p0, Lorg/telegram/messenger/voip/VoIPService;->a_or_b:[B

    return-object p1
.end method

.method static synthetic access$1600(Lorg/telegram/messenger/voip/VoIPService;I)V
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;
    .param p1, "x1"    # I

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lorg/telegram/messenger/voip/VoIPService;->dispatchStateChanged(I)V

    return-void
.end method

.method static synthetic access$1700(Lorg/telegram/messenger/voip/VoIPService;)Z
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->endCallAfterRequest:Z

    return v0
.end method

.method static synthetic access$1800(Lorg/telegram/messenger/voip/VoIPService;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->pendingUpdates:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1900(Lorg/telegram/messenger/voip/VoIPService;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1902(Lorg/telegram/messenger/voip/VoIPService;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 90
    iput-object p1, p0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$200(Lorg/telegram/messenger/voip/VoIPService;)Z
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->isHeadsetPlugged:Z

    return v0
.end method

.method static synthetic access$2000(Lorg/telegram/messenger/voip/VoIPService;I)V
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;
    .param p1, "x1"    # I

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lorg/telegram/messenger/voip/VoIPService;->callFailed(I)V

    return-void
.end method

.method static synthetic access$202(Lorg/telegram/messenger/voip/VoIPService;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;
    .param p1, "x1"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lorg/telegram/messenger/voip/VoIPService;->isHeadsetPlugged:Z

    return p1
.end method

.method static synthetic access$2100()Lorg/telegram/messenger/voip/VoIPService;
    .locals 1

    .prologue
    .line 90
    sget-object v0, Lorg/telegram/messenger/voip/VoIPService;->sharedInstance:Lorg/telegram/messenger/voip/VoIPService;

    return-object v0
.end method

.method static synthetic access$2200(Lorg/telegram/messenger/voip/VoIPService;)V
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->startRinging()V

    return-void
.end method

.method static synthetic access$2300(Lorg/telegram/messenger/voip/VoIPService;)Landroid/media/MediaPlayer;
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$2402(Lorg/telegram/messenger/voip/VoIPService;[B)[B
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;
    .param p1, "x1"    # [B

    .prologue
    .line 90
    iput-object p1, p0, Lorg/telegram/messenger/voip/VoIPService;->g_a_hash:[B

    return-object p1
.end method

.method static synthetic access$2500(Lorg/telegram/messenger/voip/VoIPService;)V
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->callEnded()V

    return-void
.end method

.method static synthetic access$2600(Lorg/telegram/messenger/voip/VoIPService;)V
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->initiateActualEncryptedCall()V

    return-void
.end method

.method static synthetic access$2700(Lorg/telegram/messenger/voip/VoIPService;)Lorg/telegram/messenger/voip/VoIPController;
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    return-object v0
.end method

.method static synthetic access$2800(Lorg/telegram/messenger/voip/VoIPService;)V
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->updateStats()V

    return-void
.end method

.method static synthetic access$2900(Lorg/telegram/messenger/voip/VoIPService;)I
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    return v0
.end method

.method static synthetic access$2902(Lorg/telegram/messenger/voip/VoIPService;I)I
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;
    .param p1, "x1"    # I

    .prologue
    .line 90
    iput p1, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    return p1
.end method

.method static synthetic access$300(Lorg/telegram/messenger/voip/VoIPService;)Landroid/os/PowerManager$WakeLock;
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->proximityWakelock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method static synthetic access$3000(Lorg/telegram/messenger/voip/VoIPService;)I
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->spConnectingId:I

    return v0
.end method

.method static synthetic access$3100(Lorg/telegram/messenger/voip/VoIPService;)Landroid/net/NetworkInfo;
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->lastNetInfo:Landroid/net/NetworkInfo;

    return-object v0
.end method

.method static synthetic access$402(Lorg/telegram/messenger/voip/VoIPService;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;
    .param p1, "x1"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lorg/telegram/messenger/voip/VoIPService;->isProximityNear:Z

    return p1
.end method

.method static synthetic access$500(Lorg/telegram/messenger/voip/VoIPService;)V
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->updateNetworkType()V

    return-void
.end method

.method static synthetic access$600(Lorg/telegram/messenger/voip/VoIPService;)I
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->endHash:I

    return v0
.end method

.method static synthetic access$700(Lorg/telegram/messenger/voip/VoIPService;)V
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->showNotification()V

    return-void
.end method

.method static synthetic access$800(Lorg/telegram/messenger/voip/VoIPService;Z)V
    .locals 0
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;
    .param p1, "x1"    # Z

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lorg/telegram/messenger/voip/VoIPService;->updateBluetoothHeadsetState(Z)V

    return-void
.end method

.method static synthetic access$900(Lorg/telegram/messenger/voip/VoIPService;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lorg/telegram/messenger/voip/VoIPService;

    .prologue
    .line 90
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->stateListeners:Ljava/util/ArrayList;

    return-object v0
.end method

.method private acknowledgeCallAndStartRinging()V
    .locals 4

    .prologue
    .line 593
    iget-object v1, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    instance-of v1, v1, Lorg/telegram/tgnet/TLRPC$TL_phoneCallDiscarded;

    if-eqz v1, :cond_0

    .line 594
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Call "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v2, v2, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " was discarded before the service started, stopping"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/telegram/messenger/FileLog;->w(Ljava/lang/String;)V

    .line 595
    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->stopSelf()V

    .line 621
    :goto_0
    return-void

    .line 598
    :cond_0
    new-instance v0, Lorg/telegram/tgnet/TLRPC$TL_phone_receivedCall;

    invoke-direct {v0}, Lorg/telegram/tgnet/TLRPC$TL_phone_receivedCall;-><init>()V

    .line 599
    .local v0, "req":Lorg/telegram/tgnet/TLRPC$TL_phone_receivedCall;
    new-instance v1, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    invoke-direct {v1}, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;-><init>()V

    iput-object v1, v0, Lorg/telegram/tgnet/TLRPC$TL_phone_receivedCall;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    .line 600
    iget-object v1, v0, Lorg/telegram/tgnet/TLRPC$TL_phone_receivedCall;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    iget-object v2, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v2, v2, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    iput-wide v2, v1, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;->id:J

    .line 601
    iget-object v1, v0, Lorg/telegram/tgnet/TLRPC$TL_phone_receivedCall;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    iget-object v2, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v2, v2, Lorg/telegram/tgnet/TLRPC$PhoneCall;->access_hash:J

    iput-wide v2, v1, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;->access_hash:J

    .line 602
    invoke-static {}, Lorg/telegram/tgnet/ConnectionsManager;->getInstance()Lorg/telegram/tgnet/ConnectionsManager;

    move-result-object v1

    new-instance v2, Lorg/telegram/messenger/voip/VoIPService$8;

    invoke-direct {v2, p0}, Lorg/telegram/messenger/voip/VoIPService$8;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    const/4 v3, 0x2

    invoke-virtual {v1, v0, v2, v3}, Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;I)I

    goto :goto_0
.end method

.method private callEnded()V
    .locals 7

    .prologue
    const/4 v4, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    .line 1315
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Call "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v0, v0, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    :goto_0
    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " ended"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V

    .line 1316
    const/16 v0, 0xb

    invoke-direct {p0, v0}, Lorg/telegram/messenger/voip/VoIPService;->dispatchStateChanged(I)V

    .line 1317
    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->needPlayEndSound:Z

    if-eqz v0, :cond_0

    .line 1318
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->playingSound:Z

    .line 1319
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lorg/telegram/messenger/voip/VoIPService;->spEndId:I

    move v3, v2

    move v5, v4

    move v6, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    .line 1320
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->afterSoundRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x2bc

    invoke-static {v0, v2, v3}, Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;J)V

    .line 1322
    :cond_0
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    .line 1323
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    invoke-static {v0}, Lorg/telegram/messenger/AndroidUtilities;->cancelRunOnUIThread(Ljava/lang/Runnable;)V

    .line 1324
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    .line 1326
    :cond_1
    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->stopSelf()V

    .line 1327
    return-void

    .line 1315
    :cond_2
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method private callFailed()V
    .locals 1

    .prologue
    .line 1275
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controllerStarted:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v0}, Lorg/telegram/messenger/voip/VoIPController;->getLastError()I

    move-result v0

    :goto_0
    invoke-direct {p0, v0}, Lorg/telegram/messenger/voip/VoIPService;->callFailed(I)V

    .line 1276
    return-void

    .line 1275
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private callFailed(I)V
    .locals 9
    .param p1, "errorCode"    # I

    .prologue
    .line 1280
    :try_start_0
    new-instance v2, Ljava/lang/Exception;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Call "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v0, v0, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    :goto_0
    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " failed with error code "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1281
    :catch_0
    move-exception v8

    .line 1282
    .local v8, "x":Ljava/lang/Exception;
    invoke-static {v8}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/Throwable;)V

    .line 1284
    iput p1, p0, Lorg/telegram/messenger/voip/VoIPService;->lastError:I

    .line 1285
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    if-eqz v0, :cond_0

    .line 1286
    const-string/jumbo v0, "Discarding failed call"

    invoke-static {v0}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V

    .line 1287
    new-instance v7, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;

    invoke-direct {v7}, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;-><init>()V

    .line 1288
    .local v7, "req":Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;
    new-instance v0, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    invoke-direct {v0}, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;-><init>()V

    iput-object v0, v7, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    .line 1289
    iget-object v0, v7, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    iget-object v1, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v2, v1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->access_hash:J

    iput-wide v2, v0, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;->access_hash:J

    .line 1290
    iget-object v0, v7, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    iget-object v1, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v2, v1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    iput-wide v2, v0, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;->id:J

    .line 1291
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controllerStarted:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v0}, Lorg/telegram/messenger/voip/VoIPController;->getCallDuration()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v0, v0

    :goto_1
    iput v0, v7, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->duration:I

    .line 1292
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controllerStarted:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v0}, Lorg/telegram/messenger/voip/VoIPController;->getPreferredRelayID()J

    move-result-wide v0

    :goto_2
    iput-wide v0, v7, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->connection_id:J

    .line 1293
    new-instance v0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallDiscardReasonDisconnect;

    invoke-direct {v0}, Lorg/telegram/tgnet/TLRPC$TL_phoneCallDiscardReasonDisconnect;-><init>()V

    iput-object v0, v7, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->reason:Lorg/telegram/tgnet/TLRPC$PhoneCallDiscardReason;

    .line 1294
    invoke-static {}, Lorg/telegram/tgnet/ConnectionsManager;->getInstance()Lorg/telegram/tgnet/ConnectionsManager;

    move-result-object v0

    new-instance v1, Lorg/telegram/messenger/voip/VoIPService$18;

    invoke-direct {v1, p0}, Lorg/telegram/messenger/voip/VoIPService$18;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    invoke-virtual {v0, v7, v1}, Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;)I

    .line 1305
    .end local v7    # "req":Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;
    :cond_0
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/telegram/messenger/voip/VoIPService;->dispatchStateChanged(I)V

    .line 1306
    const/4 v0, -0x3

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    if-eqz v0, :cond_1

    .line 1307
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->playingSound:Z

    .line 1308
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lorg/telegram/messenger/voip/VoIPService;->spFailedID:I

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    .line 1309
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->afterSoundRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3e8

    invoke-static {v0, v2, v3}, Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;J)V

    .line 1311
    :cond_1
    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->stopSelf()V

    .line 1312
    return-void

    .line 1280
    .end local v8    # "x":Ljava/lang/Exception;
    :cond_2
    const-wide/16 v0, 0x0

    goto/16 :goto_0

    .line 1291
    .restart local v7    # "req":Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;
    .restart local v8    # "x":Ljava/lang/Exception;
    :cond_3
    const/4 v0, 0x0

    goto :goto_1

    .line 1292
    :cond_4
    const-wide/16 v0, 0x0

    goto :goto_2
.end method

.method private configureDeviceForCall()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 1471
    iput-boolean v6, p0, Lorg/telegram/messenger/voip/VoIPService;->needPlayEndSound:Z

    .line 1472
    const-string/jumbo v4, "audio"

    invoke-virtual {p0, v4}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 1473
    .local v0, "am":Landroid/media/AudioManager;
    invoke-virtual {v0, v7}, Landroid/media/AudioManager;->setMode(I)V

    .line 1474
    invoke-virtual {v0, v5}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 1475
    invoke-virtual {v0, p0, v5, v6}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 1477
    const-string/jumbo v4, "sensor"

    invoke-virtual {p0, v4}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/SensorManager;

    .line 1478
    .local v2, "sm":Landroid/hardware/SensorManager;
    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    .line 1480
    .local v1, "proximity":Landroid/hardware/Sensor;
    if-eqz v1, :cond_0

    .line 1481
    :try_start_0
    const-string/jumbo v4, "power"

    invoke-virtual {p0, v4}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/PowerManager;

    const/16 v5, 0x20

    const-string/jumbo v6, "telegram-voip-prx"

    invoke-virtual {v4, v5, v6}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v4

    iput-object v4, p0, Lorg/telegram/messenger/voip/VoIPService;->proximityWakelock:Landroid/os/PowerManager$WakeLock;

    .line 1482
    const/4 v4, 0x3

    invoke-virtual {v2, p0, v1, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1487
    :cond_0
    :goto_0
    return-void

    .line 1484
    :catch_0
    move-exception v3

    .line 1485
    .local v3, "x":Ljava/lang/Exception;
    const-string/jumbo v4, "Error initializing proximity sensor"

    invoke-static {v4, v3}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private dispatchStateChanged(I)V
    .locals 5
    .param p1, "state"    # I

    .prologue
    .line 1490
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "== Call "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v2, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v2, v2, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    :goto_0
    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " state changed to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " =="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V

    .line 1491
    iput p1, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    .line 1492
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_1
    iget-object v2, p0, Lorg/telegram/messenger/voip/VoIPService;->stateListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 1493
    iget-object v2, p0, Lorg/telegram/messenger/voip/VoIPService;->stateListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/telegram/messenger/voip/VoIPService$StateListener;

    .line 1494
    .local v1, "l":Lorg/telegram/messenger/voip/VoIPService$StateListener;
    invoke-interface {v1, p1}, Lorg/telegram/messenger/voip/VoIPService$StateListener;->onStateChanged(I)V

    .line 1492
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1490
    .end local v0    # "a":I
    .end local v1    # "l":Lorg/telegram/messenger/voip/VoIPService$StateListener;
    :cond_0
    const-wide/16 v2, 0x0

    goto :goto_0

    .line 1496
    .restart local v0    # "a":I
    :cond_1
    return-void
.end method

.method private dumpCallObject()V
    .locals 7

    .prologue
    .line 865
    :try_start_0
    const-class v3, Lorg/telegram/tgnet/TLRPC$PhoneCall;

    invoke-virtual {v3}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    .line 866
    .local v1, "flds":[Ljava/lang/reflect/Field;
    array-length v4, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v0, v1, v3

    .line 867
    .local v0, "f":Ljava/lang/reflect/Field;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    invoke-virtual {v0, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 866
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 869
    .end local v0    # "f":Ljava/lang/reflect/Field;
    .end local v1    # "flds":[Ljava/lang/reflect/Field;
    :catch_0
    move-exception v2

    .line 870
    .local v2, "x":Ljava/lang/Exception;
    invoke-static {v2}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/Throwable;)V

    .line 872
    .end local v2    # "x":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method public static getSharedInstance()Lorg/telegram/messenger/voip/VoIPService;
    .locals 1

    .prologue
    .line 419
    sget-object v0, Lorg/telegram/messenger/voip/VoIPService;->sharedInstance:Lorg/telegram/messenger/voip/VoIPService;

    return-object v0
.end method

.method private getStatsNetworkType()I
    .locals 2

    .prologue
    .line 1577
    const/4 v0, 0x1

    .line 1578
    .local v0, "netType":I
    iget-object v1, p0, Lorg/telegram/messenger/voip/VoIPService;->lastNetInfo:Landroid/net/NetworkInfo;

    if-eqz v1, :cond_0

    .line 1579
    iget-object v1, p0, Lorg/telegram/messenger/voip/VoIPService;->lastNetInfo:Landroid/net/NetworkInfo;

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    if-nez v1, :cond_0

    .line 1580
    iget-object v1, p0, Lorg/telegram/messenger/voip/VoIPService;->lastNetInfo:Landroid/net/NetworkInfo;

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isRoaming()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x2

    .line 1582
    :cond_0
    :goto_0
    return v0

    .line 1580
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private initiateActualEncryptedCall()V
    .locals 26

    .prologue
    .line 1075
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    if-eqz v3, :cond_0

    .line 1076
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    invoke-static {v3}, Lorg/telegram/messenger/AndroidUtilities;->cancelRunOnUIThread(Ljava/lang/Runnable;)V

    .line 1077
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    .line 1080
    :cond_0
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "InitCall: keyID="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/telegram/messenger/voip/VoIPService;->keyFingerprint:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V

    .line 1081
    const-string/jumbo v3, "notifications"

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lorg/telegram/messenger/voip/VoIPService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v15

    .line 1082
    .local v15, "nprefs":Landroid/content/SharedPreferences;
    new-instance v11, Ljava/util/HashSet;

    const-string/jumbo v3, "calls_access_hashes"

    sget-object v4, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-interface {v15, v3, v4}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v3

    invoke-direct {v11, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 1083
    .local v11, "hashes":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v4, v4, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v4, v4, Lorg/telegram/tgnet/TLRPC$PhoneCall;->access_hash:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1084
    :cond_1
    :goto_0
    invoke-virtual {v11}, Ljava/util/HashSet;->size()I

    move-result v3

    const/16 v4, 0x14

    if-le v3, v4, :cond_5

    .line 1085
    const/16 v16, 0x0

    .line 1086
    .local v16, "oldest":Ljava/lang/String;
    const-wide v18, 0x7fffffffffffffffL

    .line 1087
    .local v18, "oldestTime":J
    invoke-virtual {v11}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .line 1088
    .local v14, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    :goto_1
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1089
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 1090
    .local v13, "item":Ljava/lang/String;
    const-string/jumbo v3, " "

    invoke-virtual {v13, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v21

    .line 1091
    .local v21, "s":[Ljava/lang/String;
    move-object/from16 v0, v21

    array-length v3, v0

    const/4 v4, 0x2

    if-ge v3, v4, :cond_3

    .line 1092
    invoke-interface {v14}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1139
    .end local v11    # "hashes":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v13    # "item":Ljava/lang/String;
    .end local v14    # "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v15    # "nprefs":Landroid/content/SharedPreferences;
    .end local v16    # "oldest":Ljava/lang/String;
    .end local v18    # "oldestTime":J
    .end local v21    # "s":[Ljava/lang/String;
    :catch_0
    move-exception v23

    .line 1140
    .local v23, "x":Ljava/lang/Exception;
    const-string/jumbo v3, "error starting call"

    move-object/from16 v0, v23

    invoke-static {v3, v0}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1141
    invoke-direct/range {p0 .. p0}, Lorg/telegram/messenger/voip/VoIPService;->callFailed()V

    .line 1143
    .end local v23    # "x":Ljava/lang/Exception;
    :goto_2
    return-void

    .line 1095
    .restart local v11    # "hashes":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v13    # "item":Ljava/lang/String;
    .restart local v14    # "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v15    # "nprefs":Landroid/content/SharedPreferences;
    .restart local v16    # "oldest":Ljava/lang/String;
    .restart local v18    # "oldestTime":J
    .restart local v21    # "s":[Ljava/lang/String;
    :cond_3
    const/4 v3, 0x2

    :try_start_1
    aget-object v3, v21, v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v24

    .line 1096
    .local v24, "t":J
    cmp-long v3, v24, v18

    if-gez v3, :cond_2

    .line 1097
    move-wide/from16 v18, v24

    .line 1098
    move-object/from16 v16, v13

    goto :goto_1

    .line 1100
    .end local v24    # "t":J
    :catch_1
    move-exception v23

    .line 1101
    .restart local v23    # "x":Ljava/lang/Exception;
    :try_start_2
    invoke-interface {v14}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 1105
    .end local v13    # "item":Ljava/lang/String;
    .end local v21    # "s":[Ljava/lang/String;
    .end local v23    # "x":Ljava/lang/Exception;
    :cond_4
    if-eqz v16, :cond_1

    .line 1106
    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1108
    .end local v14    # "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v16    # "oldest":Ljava/lang/String;
    .end local v18    # "oldestTime":J
    :cond_5
    invoke-interface {v15}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "calls_access_hashes"

    invoke-interface {v3, v4, v11}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1109
    sget-object v3, Lorg/telegram/messenger/ApplicationLoader;->mainconfig:Ljava/lang/String;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lorg/telegram/messenger/voip/VoIPService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v17

    .line 1110
    .local v17, "preferences":Landroid/content/SharedPreferences;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v4

    iget v4, v4, Lorg/telegram/messenger/MessagesController;->callPacketTimeout:I

    int-to-double v4, v4

    const-wide v6, 0x408f400000000000L    # 1000.0

    div-double/2addr v4, v6

    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget v6, v6, Lorg/telegram/messenger/MessagesController;->callConnectTimeout:I

    int-to-double v6, v6

    const-wide v8, 0x408f400000000000L    # 1000.0

    div-double/2addr v6, v8

    const-string/jumbo v8, "VoipDataSaving"

    const/4 v9, 0x0

    .line 1111
    move-object/from16 v0, v17

    invoke-interface {v0, v8, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v9, v9, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    .line 1110
    invoke-virtual/range {v3 .. v10}, Lorg/telegram/messenger/voip/VoIPController;->setConfig(DDIJ)V

    .line 1112
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/telegram/messenger/voip/VoIPService;->authKey:[B

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lorg/telegram/messenger/voip/VoIPService;->isOutgoing:Z

    invoke-virtual {v3, v4, v5}, Lorg/telegram/messenger/voip/VoIPController;->setEncryptionKey([BZ)V

    .line 1113
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-object v3, v3, Lorg/telegram/tgnet/TLRPC$PhoneCall;->alternative_connections:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    new-array v2, v3, [Lorg/telegram/tgnet/TLRPC$TL_phoneConnection;

    .line 1114
    .local v2, "endpoints":[Lorg/telegram/tgnet/TLRPC$TL_phoneConnection;
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-object v4, v4, Lorg/telegram/tgnet/TLRPC$PhoneCall;->connection:Lorg/telegram/tgnet/TLRPC$TL_phoneConnection;

    aput-object v4, v2, v3

    .line 1115
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-object v3, v3, Lorg/telegram/tgnet/TLRPC$PhoneCall;->alternative_connections:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v12, v3, :cond_6

    .line 1116
    add-int/lit8 v4, v12, 0x1

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-object v3, v3, Lorg/telegram/tgnet/TLRPC$PhoneCall;->alternative_connections:Ljava/util/ArrayList;

    invoke-virtual {v3, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/telegram/tgnet/TLRPC$TL_phoneConnection;

    aput-object v3, v2, v4

    .line 1115
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 1118
    :cond_6
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-object v3, v3, Lorg/telegram/tgnet/TLRPC$PhoneCall;->protocol:Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;

    iget-boolean v3, v3, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->udp_p2p:Z

    if-eqz v3, :cond_8

    sget-object v3, Lorg/telegram/messenger/ApplicationLoader;->mainconfig:Ljava/lang/String;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v5}, Lorg/telegram/messenger/voip/VoIPService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string/jumbo v5, "calls_p2p"

    const/4 v6, 0x1

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_8

    const/4 v3, 0x1

    :goto_4
    invoke-virtual {v4, v2, v3}, Lorg/telegram/messenger/voip/VoIPController;->setRemoteEndpoints([Lorg/telegram/tgnet/TLRPC$TL_phoneConnection;Z)V

    .line 1119
    sget-object v3, Lorg/telegram/messenger/ApplicationLoader;->applicationContext:Landroid/content/Context;

    sget-object v4, Lorg/telegram/messenger/ApplicationLoader;->mainconfig:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v20

    .line 1120
    .local v20, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v3, "proxy_enabled"

    const/4 v4, 0x0

    move-object/from16 v0, v20

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_7

    const-string/jumbo v3, "proxy_enabled_calls"

    const/4 v4, 0x0

    move-object/from16 v0, v20

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 1121
    const-string/jumbo v3, "proxy_ip"

    const/4 v4, 0x0

    move-object/from16 v0, v20

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 1122
    .local v22, "server":Ljava/lang/String;
    if-eqz v22, :cond_7

    .line 1123
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    const-string/jumbo v4, "proxy_port"

    const/4 v5, 0x0

    move-object/from16 v0, v20

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    const-string/jumbo v5, "proxy_user"

    const/4 v6, 0x0

    move-object/from16 v0, v20

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "proxy_pass"

    const/4 v7, 0x0

    move-object/from16 v0, v20

    invoke-interface {v0, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v22

    invoke-virtual {v3, v0, v4, v5, v6}, Lorg/telegram/messenger/voip/VoIPController;->setProxy(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 1126
    .end local v22    # "server":Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v3}, Lorg/telegram/messenger/voip/VoIPController;->start()V

    .line 1127
    invoke-direct/range {p0 .. p0}, Lorg/telegram/messenger/voip/VoIPService;->updateNetworkType()V

    .line 1128
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v3}, Lorg/telegram/messenger/voip/VoIPController;->connect()V

    .line 1129
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lorg/telegram/messenger/voip/VoIPService;->controllerStarted:Z

    .line 1130
    new-instance v3, Lorg/telegram/messenger/voip/VoIPService$16;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lorg/telegram/messenger/voip/VoIPService$16;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    const-wide/16 v4, 0x1388

    invoke-static {v3, v4, v5}, Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_2

    .line 1118
    .end local v20    # "prefs":Landroid/content/SharedPreferences;
    :cond_8
    const/4 v3, 0x0

    goto :goto_4
.end method

.method private processAcceptedCall()V
    .locals 14

    .prologue
    .line 1009
    iget-boolean v11, p0, Lorg/telegram/messenger/voip/VoIPService;->isProximityNear:Z

    if-nez v11, :cond_0

    .line 1010
    const-string/jumbo v11, "vibrator"

    invoke-virtual {p0, v11}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/os/Vibrator;

    .line 1011
    .local v10, "vibrator":Landroid/os/Vibrator;
    invoke-virtual {v10}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 1012
    const-wide/16 v12, 0x64

    invoke-virtual {v10, v12, v13}, Landroid/os/Vibrator;->vibrate(J)V

    .line 1015
    .end local v10    # "vibrator":Landroid/os/Vibrator;
    :cond_0
    const/16 v11, 0xc

    invoke-direct {p0, v11}, Lorg/telegram/messenger/voip/VoIPService;->dispatchStateChanged(I)V

    .line 1016
    new-instance v8, Ljava/math/BigInteger;

    const/4 v11, 0x1

    sget-object v12, Lorg/telegram/messenger/MessagesStorage;->secretPBytes:[B

    invoke-direct {v8, v11, v12}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 1017
    .local v8, "p":Ljava/math/BigInteger;
    new-instance v5, Ljava/math/BigInteger;

    const/4 v11, 0x1

    iget-object v12, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-object v12, v12, Lorg/telegram/tgnet/TLRPC$PhoneCall;->g_b:[B

    invoke-direct {v5, v11, v12}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 1019
    .local v5, "i_authKey":Ljava/math/BigInteger;
    invoke-static {v5, v8}, Lorg/telegram/messenger/Utilities;->isGoodGaAndGb(Ljava/math/BigInteger;Ljava/math/BigInteger;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 1020
    const-string/jumbo v11, "stopping VoIP service, bad Ga and Gb"

    invoke-static {v11}, Lorg/telegram/messenger/FileLog;->w(Ljava/lang/String;)V

    .line 1021
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->callFailed()V

    .line 1072
    :goto_0
    return-void

    .line 1025
    :cond_1
    new-instance v11, Ljava/math/BigInteger;

    const/4 v12, 0x1

    iget-object v13, p0, Lorg/telegram/messenger/voip/VoIPService;->a_or_b:[B

    invoke-direct {v11, v12, v13}, Ljava/math/BigInteger;-><init>(I[B)V

    invoke-virtual {v5, v11, v8}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    .line 1027
    invoke-virtual {v5}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v1

    .line 1028
    .local v1, "authKey":[B
    array-length v11, v1

    const/16 v12, 0x100

    if-le v11, v12, :cond_3

    .line 1029
    const/16 v11, 0x100

    new-array v4, v11, [B

    .line 1030
    .local v4, "correctedAuth":[B
    array-length v11, v1

    add-int/lit16 v11, v11, -0x100

    const/4 v12, 0x0

    const/16 v13, 0x100

    invoke-static {v1, v11, v4, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1031
    move-object v1, v4

    .line 1040
    .end local v4    # "correctedAuth":[B
    :cond_2
    :goto_1
    invoke-static {v1}, Lorg/telegram/messenger/Utilities;->computeSHA1([B)[B

    move-result-object v2

    .line 1041
    .local v2, "authKeyHash":[B
    const/16 v11, 0x8

    new-array v3, v11, [B

    .line 1042
    .local v3, "authKeyId":[B
    array-length v11, v2

    add-int/lit8 v11, v11, -0x8

    const/4 v12, 0x0

    const/16 v13, 0x8

    invoke-static {v2, v11, v3, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1043
    invoke-static {v3}, Lorg/telegram/messenger/Utilities;->bytesToLong([B)J

    move-result-wide v6

    .line 1044
    .local v6, "fingerprint":J
    iput-object v1, p0, Lorg/telegram/messenger/voip/VoIPService;->authKey:[B

    .line 1045
    iput-wide v6, p0, Lorg/telegram/messenger/voip/VoIPService;->keyFingerprint:J

    .line 1046
    new-instance v9, Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;

    invoke-direct {v9}, Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;-><init>()V

    .line 1047
    .local v9, "req":Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;
    iget-object v11, p0, Lorg/telegram/messenger/voip/VoIPService;->g_a:[B

    iput-object v11, v9, Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;->g_a:[B

    .line 1048
    iput-wide v6, v9, Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;->key_fingerprint:J

    .line 1049
    new-instance v11, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    invoke-direct {v11}, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;-><init>()V

    iput-object v11, v9, Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    .line 1050
    iget-object v11, v9, Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    iget-object v12, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v12, v12, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    iput-wide v12, v11, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;->id:J

    .line 1051
    iget-object v11, v9, Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    iget-object v12, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v12, v12, Lorg/telegram/tgnet/TLRPC$PhoneCall;->access_hash:J

    iput-wide v12, v11, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;->access_hash:J

    .line 1052
    new-instance v11, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;

    invoke-direct {v11}, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;-><init>()V

    iput-object v11, v9, Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;->protocol:Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;

    .line 1053
    iget-object v11, v9, Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;->protocol:Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;

    const/16 v12, 0x41

    iput v12, v11, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->max_layer:I

    .line 1054
    iget-object v11, v9, Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;->protocol:Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;

    const/16 v12, 0x41

    iput v12, v11, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->min_layer:I

    .line 1055
    iget-object v11, v9, Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;->protocol:Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;

    iget-object v12, v9, Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;->protocol:Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;

    const/4 v13, 0x1

    iput-boolean v13, v12, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->udp_reflector:Z

    iput-boolean v13, v11, Lorg/telegram/tgnet/TLRPC$TL_phoneCallProtocol;->udp_p2p:Z

    .line 1056
    invoke-static {}, Lorg/telegram/tgnet/ConnectionsManager;->getInstance()Lorg/telegram/tgnet/ConnectionsManager;

    move-result-object v11

    new-instance v12, Lorg/telegram/messenger/voip/VoIPService$15;

    invoke-direct {v12, p0}, Lorg/telegram/messenger/voip/VoIPService$15;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    invoke-virtual {v11, v9, v12}, Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;)I

    goto/16 :goto_0

    .line 1032
    .end local v2    # "authKeyHash":[B
    .end local v3    # "authKeyId":[B
    .end local v6    # "fingerprint":J
    .end local v9    # "req":Lorg/telegram/tgnet/TLRPC$TL_phone_confirmCall;
    :cond_3
    array-length v11, v1

    const/16 v12, 0x100

    if-ge v11, v12, :cond_2

    .line 1033
    const/16 v11, 0x100

    new-array v4, v11, [B

    .line 1034
    .restart local v4    # "correctedAuth":[B
    const/4 v11, 0x0

    array-length v12, v1

    rsub-int v12, v12, 0x100

    array-length v13, v1

    invoke-static {v1, v11, v4, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1035
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_2
    array-length v11, v1

    rsub-int v11, v11, 0x100

    if-ge v0, v11, :cond_4

    .line 1036
    const/4 v11, 0x0

    aput-byte v11, v1, v0

    .line 1035
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1038
    :cond_4
    move-object v1, v4

    goto/16 :goto_1
.end method

.method private showIncomingNotification()V
    .locals 24

    .prologue
    .line 1192
    new-instance v15, Landroid/content/Intent;

    const-class v19, Lorg/telegram/ui/VoIPActivity;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v15, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1193
    .local v15, "intent":Landroid/content/Intent;
    const/high16 v19, 0x30000000

    move/from16 v0, v19

    invoke-virtual {v15, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1194
    new-instance v19, Landroid/app/Notification$Builder;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const-string/jumbo v20, "VoipInCallBranding"

    const v21, 0x7f070757

    .line 1195
    invoke-static/range {v20 .. v21}, Lorg/telegram/messenger/LocaleController;->getString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/telegram/tgnet/TLRPC$User;->first_name:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/telegram/tgnet/TLRPC$User;->last_name:Ljava/lang/String;

    move-object/from16 v21, v0

    .line 1196
    invoke-static/range {v20 .. v21}, Lorg/telegram/messenger/ContactsController;->formatName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v19

    const v20, 0x7f0201e5

    .line 1197
    invoke-virtual/range {v19 .. v20}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v19

    const/16 v20, 0x0

    const/16 v21, 0x0

    .line 1198
    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v15, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v8

    .line 1199
    .local v8, "builder":Landroid/app/Notification$Builder;
    sget v19, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v20, 0x10

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_2

    .line 1200
    sget-object v19, Lorg/telegram/messenger/Utilities;->random:Ljava/security/SecureRandom;

    invoke-virtual/range {v19 .. v19}, Ljava/security/SecureRandom;->nextInt()I

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/telegram/messenger/voip/VoIPService;->endHash:I

    .line 1201
    new-instance v10, Landroid/content/Intent;

    invoke-direct {v10}, Landroid/content/Intent;-><init>()V

    .line 1202
    .local v10, "endIntent":Landroid/content/Intent;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lorg/telegram/messenger/voip/VoIPService;->getPackageName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string/jumbo v20, ".DECLINE_CALL"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1203
    const-string/jumbo v19, "end_hash"

    move-object/from16 v0, p0

    iget v0, v0, Lorg/telegram/messenger/voip/VoIPService;->endHash:I

    move/from16 v20, v0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1204
    const-string/jumbo v19, "VoipDeclineCall"

    const v20, 0x7f070750

    invoke-static/range {v19 .. v20}, Lorg/telegram/messenger/LocaleController;->getString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v11

    .line 1205
    .local v11, "endTitle":Ljava/lang/CharSequence;
    sget v19, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v20, 0x18

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_0

    .line 1206
    new-instance v12, Landroid/text/SpannableString;

    invoke-direct {v12, v11}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .end local v11    # "endTitle":Ljava/lang/CharSequence;
    .local v12, "endTitle":Ljava/lang/CharSequence;
    move-object/from16 v19, v12

    .line 1207
    check-cast v19, Landroid/text/SpannableString;

    new-instance v20, Landroid/text/style/ForegroundColorSpan;

    const v21, -0xbbcca

    invoke-direct/range {v20 .. v21}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v21, 0x0

    invoke-interface {v12}, Ljava/lang/CharSequence;->length()I

    move-result v22

    const/16 v23, 0x0

    invoke-virtual/range {v19 .. v23}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    move-object v11, v12

    .line 1209
    .end local v12    # "endTitle":Ljava/lang/CharSequence;
    .restart local v11    # "endTitle":Ljava/lang/CharSequence;
    :cond_0
    const v19, 0x7f0200d5

    const/16 v20, 0x0

    const/high16 v21, 0x8000000

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v10, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v20

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v8, v0, v11, v1}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 1210
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 1211
    .local v4, "answerIntent":Landroid/content/Intent;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lorg/telegram/messenger/voip/VoIPService;->getPackageName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string/jumbo v20, ".ANSWER_CALL"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1212
    const-string/jumbo v19, "end_hash"

    move-object/from16 v0, p0

    iget v0, v0, Lorg/telegram/messenger/voip/VoIPService;->endHash:I

    move/from16 v20, v0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v4, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1213
    const-string/jumbo v19, "VoipAnswerCall"

    const v20, 0x7f070749

    invoke-static/range {v19 .. v20}, Lorg/telegram/messenger/LocaleController;->getString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    .line 1214
    .local v5, "answerTitle":Ljava/lang/CharSequence;
    sget v19, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v20, 0x18

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_1

    .line 1215
    new-instance v6, Landroid/text/SpannableString;

    invoke-direct {v6, v5}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .end local v5    # "answerTitle":Ljava/lang/CharSequence;
    .local v6, "answerTitle":Ljava/lang/CharSequence;
    move-object/from16 v19, v6

    .line 1216
    check-cast v19, Landroid/text/SpannableString;

    new-instance v20, Landroid/text/style/ForegroundColorSpan;

    const v21, -0xff5600

    invoke-direct/range {v20 .. v21}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v21, 0x0

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v22

    const/16 v23, 0x0

    invoke-virtual/range {v19 .. v23}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    move-object v5, v6

    .line 1218
    .end local v6    # "answerTitle":Ljava/lang/CharSequence;
    .restart local v5    # "answerTitle":Ljava/lang/CharSequence;
    :cond_1
    const v19, 0x7f0200da

    const/16 v20, 0x0

    const/high16 v21, 0x8000000

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v4, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v20

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v8, v0, v5, v1}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 1219
    const/16 v19, 0x2

    move/from16 v0, v19

    invoke-virtual {v8, v0}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    .line 1221
    .end local v4    # "answerIntent":Landroid/content/Intent;
    .end local v5    # "answerTitle":Ljava/lang/CharSequence;
    .end local v10    # "endIntent":Landroid/content/Intent;
    .end local v11    # "endTitle":Ljava/lang/CharSequence;
    :cond_2
    sget v19, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v20, 0x11

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_3

    .line 1222
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v8, v0}, Landroid/app/Notification$Builder;->setShowWhen(Z)Landroid/app/Notification$Builder;

    .line 1224
    :cond_3
    sget v19, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v20, 0x15

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_4

    .line 1225
    const v19, -0xd35a20

    move/from16 v0, v19

    invoke-virtual {v8, v0}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    .line 1226
    const/16 v19, 0x0

    move/from16 v0, v19

    new-array v0, v0, [J

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    .line 1227
    const-string/jumbo v19, "call"

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Landroid/app/Notification$Builder;->setCategory(Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 1228
    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v15, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v19

    const/16 v20, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v8, v0, v1}, Landroid/app/Notification$Builder;->setFullScreenIntent(Landroid/app/PendingIntent;Z)Landroid/app/Notification$Builder;

    .line 1230
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/telegram/tgnet/TLRPC$User;->photo:Lorg/telegram/tgnet/TLRPC$UserProfilePhoto;

    move-object/from16 v19, v0

    if-eqz v19, :cond_5

    .line 1231
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/telegram/tgnet/TLRPC$User;->photo:Lorg/telegram/tgnet/TLRPC$UserProfilePhoto;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/telegram/tgnet/TLRPC$UserProfilePhoto;->photo_small:Lorg/telegram/tgnet/TLRPC$FileLocation;

    move-object/from16 v17, v0

    .line 1232
    .local v17, "photoPath":Lorg/telegram/tgnet/TLRPC$FileLocation;
    if-eqz v17, :cond_5

    .line 1233
    invoke-static {}, Lorg/telegram/messenger/ImageLoader;->getInstance()Lorg/telegram/messenger/ImageLoader;

    move-result-object v19

    const/16 v20, 0x0

    const-string/jumbo v21, "50_50"

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    move-object/from16 v2, v20

    move-object/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lorg/telegram/messenger/ImageLoader;->getImageFromMemory(Lorg/telegram/tgnet/TLObject;Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v13

    .line 1234
    .local v13, "img":Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v13, :cond_6

    .line 1235
    invoke-virtual {v13}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    .line 1251
    .end local v13    # "img":Landroid/graphics/drawable/BitmapDrawable;
    .end local v17    # "photoPath":Lorg/telegram/tgnet/TLRPC$FileLocation;
    :cond_5
    :goto_0
    invoke-virtual {v8}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v14

    .line 1252
    .local v14, "incomingNotification":Landroid/app/Notification;
    const/16 v19, 0xca

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1, v14}, Lorg/telegram/messenger/voip/VoIPService;->startForeground(ILandroid/app/Notification;)V

    .line 1253
    return-void

    .line 1238
    .end local v14    # "incomingNotification":Landroid/app/Notification;
    .restart local v13    # "img":Landroid/graphics/drawable/BitmapDrawable;
    .restart local v17    # "photoPath":Lorg/telegram/tgnet/TLRPC$FileLocation;
    :cond_6
    const/high16 v19, 0x43200000    # 160.0f

    const/high16 v20, 0x42480000    # 50.0f

    :try_start_0
    invoke-static/range {v20 .. v20}, Lorg/telegram/messenger/AndroidUtilities;->dp(F)I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    div-float v18, v19, v20

    .line 1239
    .local v18, "scaleFactor":F
    new-instance v16, Landroid/graphics/BitmapFactory$Options;

    invoke-direct/range {v16 .. v16}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 1240
    .local v16, "options":Landroid/graphics/BitmapFactory$Options;
    const/high16 v19, 0x3f800000    # 1.0f

    cmpg-float v19, v18, v19

    if-gez v19, :cond_7

    const/16 v19, 0x1

    :goto_1
    move/from16 v0, v19

    move-object/from16 v1, v16

    iput v0, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 1241
    const/16 v19, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/telegram/messenger/FileLoader;->getPathToAttach(Lorg/telegram/tgnet/TLObject;Z)Ljava/io/File;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 1242
    .local v7, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v7, :cond_5

    .line 1243
    invoke-virtual {v8, v7}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1245
    .end local v7    # "bitmap":Landroid/graphics/Bitmap;
    .end local v16    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v18    # "scaleFactor":F
    :catch_0
    move-exception v9

    .line 1246
    .local v9, "e":Ljava/lang/Throwable;
    invoke-static {v9}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1240
    .end local v9    # "e":Ljava/lang/Throwable;
    .restart local v16    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v18    # "scaleFactor":F
    :cond_7
    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v19, v0

    goto :goto_1
.end method

.method private showNotification()V
    .locals 14

    .prologue
    const/4 v9, 0x1

    const/4 v13, 0x0

    .line 1146
    new-instance v5, Landroid/content/Intent;

    const-class v10, Lorg/telegram/ui/VoIPActivity;

    invoke-direct {v5, p0, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1147
    .local v5, "intent":Landroid/content/Intent;
    const/high16 v10, 0x30000000

    invoke-virtual {v5, v10}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1148
    new-instance v10, Landroid/app/Notification$Builder;

    invoke-direct {v10, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const-string/jumbo v11, "VoipOutgoingCall"

    const v12, 0x7f070762

    .line 1149
    invoke-static {v11, v12}, Lorg/telegram/messenger/LocaleController;->getString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v10

    iget-object v11, p0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    iget-object v11, v11, Lorg/telegram/tgnet/TLRPC$User;->first_name:Ljava/lang/String;

    iget-object v12, p0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    iget-object v12, v12, Lorg/telegram/tgnet/TLRPC$User;->last_name:Ljava/lang/String;

    .line 1150
    invoke-static {v11, v12}, Lorg/telegram/messenger/ContactsController;->formatName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v10

    const v11, 0x7f0201e5

    .line 1151
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v10

    .line 1152
    invoke-static {p0, v13, v5, v13}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 1153
    .local v1, "builder":Landroid/app/Notification$Builder;
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x10

    if-lt v10, v11, :cond_0

    .line 1154
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 1155
    .local v3, "endIntent":Landroid/content/Intent;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ".END_CALL"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v10}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1156
    const-string/jumbo v10, "end_hash"

    sget-object v11, Lorg/telegram/messenger/Utilities;->random:Ljava/security/SecureRandom;

    invoke-virtual {v11}, Ljava/security/SecureRandom;->nextInt()I

    move-result v11

    iput v11, p0, Lorg/telegram/messenger/voip/VoIPService;->endHash:I

    invoke-virtual {v3, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1157
    const v10, 0x7f0200d5

    const-string/jumbo v11, "VoipEndCall"

    const v12, 0x7f070751

    invoke-static {v11, v12}, Lorg/telegram/messenger/LocaleController;->getString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v11

    const/high16 v12, 0x8000000

    invoke-static {p0, v13, v3, v12}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v12

    invoke-virtual {v1, v10, v11, v12}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 1158
    const/4 v10, 0x2

    invoke-virtual {v1, v10}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    .line 1160
    .end local v3    # "endIntent":Landroid/content/Intent;
    :cond_0
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x11

    if-lt v10, v11, :cond_1

    .line 1161
    invoke-virtual {v1, v13}, Landroid/app/Notification$Builder;->setShowWhen(Z)Landroid/app/Notification$Builder;

    .line 1163
    :cond_1
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x15

    if-lt v10, v11, :cond_2

    .line 1164
    const v10, -0xd35a20

    invoke-virtual {v1, v10}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    .line 1166
    :cond_2
    iget-object v10, p0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    iget-object v10, v10, Lorg/telegram/tgnet/TLRPC$User;->photo:Lorg/telegram/tgnet/TLRPC$UserProfilePhoto;

    if-eqz v10, :cond_3

    .line 1167
    iget-object v10, p0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    iget-object v10, v10, Lorg/telegram/tgnet/TLRPC$User;->photo:Lorg/telegram/tgnet/TLRPC$UserProfilePhoto;

    iget-object v7, v10, Lorg/telegram/tgnet/TLRPC$UserProfilePhoto;->photo_small:Lorg/telegram/tgnet/TLRPC$FileLocation;

    .line 1168
    .local v7, "photoPath":Lorg/telegram/tgnet/TLRPC$FileLocation;
    if-eqz v7, :cond_3

    .line 1169
    invoke-static {}, Lorg/telegram/messenger/ImageLoader;->getInstance()Lorg/telegram/messenger/ImageLoader;

    move-result-object v10

    const/4 v11, 0x0

    const-string/jumbo v12, "50_50"

    invoke-virtual {v10, v7, v11, v12}, Lorg/telegram/messenger/ImageLoader;->getImageFromMemory(Lorg/telegram/tgnet/TLObject;Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v4

    .line 1170
    .local v4, "img":Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v4, :cond_4

    .line 1171
    invoke-virtual {v4}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v9

    invoke-virtual {v1, v9}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    .line 1187
    .end local v4    # "img":Landroid/graphics/drawable/BitmapDrawable;
    .end local v7    # "photoPath":Lorg/telegram/tgnet/TLRPC$FileLocation;
    :cond_3
    :goto_0
    invoke-virtual {v1}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v9

    iput-object v9, p0, Lorg/telegram/messenger/voip/VoIPService;->ongoingCallNotification:Landroid/app/Notification;

    .line 1188
    const/16 v9, 0xc9

    iget-object v10, p0, Lorg/telegram/messenger/voip/VoIPService;->ongoingCallNotification:Landroid/app/Notification;

    invoke-virtual {p0, v9, v10}, Lorg/telegram/messenger/voip/VoIPService;->startForeground(ILandroid/app/Notification;)V

    .line 1189
    return-void

    .line 1174
    .restart local v4    # "img":Landroid/graphics/drawable/BitmapDrawable;
    .restart local v7    # "photoPath":Lorg/telegram/tgnet/TLRPC$FileLocation;
    :cond_4
    const/high16 v10, 0x43200000    # 160.0f

    const/high16 v11, 0x42480000    # 50.0f

    :try_start_0
    invoke-static {v11}, Lorg/telegram/messenger/AndroidUtilities;->dp(F)I

    move-result v11

    int-to-float v11, v11

    div-float v8, v10, v11

    .line 1175
    .local v8, "scaleFactor":F
    new-instance v6, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v6}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 1176
    .local v6, "options":Landroid/graphics/BitmapFactory$Options;
    const/high16 v10, 0x3f800000    # 1.0f

    cmpg-float v10, v8, v10

    if-gez v10, :cond_5

    :goto_1
    iput v9, v6, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 1177
    const/4 v9, 0x1

    invoke-static {v7, v9}, Lorg/telegram/messenger/FileLoader;->getPathToAttach(Lorg/telegram/tgnet/TLObject;Z)Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v6}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1178
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_3

    .line 1179
    invoke-virtual {v1, v0}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1181
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v6    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v8    # "scaleFactor":F
    :catch_0
    move-exception v2

    .line 1182
    .local v2, "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1176
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v6    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v8    # "scaleFactor":F
    :cond_5
    float-to-int v9, v8

    goto :goto_1
.end method

.method private startConnectingSound()V
    .locals 7

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    .line 1256
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    if-eqz v0, :cond_0

    .line 1257
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    .line 1258
    :cond_0
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lorg/telegram/messenger/voip/VoIPService;->spConnectingId:I

    const/4 v4, 0x0

    const/4 v5, -0x1

    move v3, v2

    move v6, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    iput v0, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    .line 1259
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    if-nez v0, :cond_1

    .line 1260
    new-instance v0, Lorg/telegram/messenger/voip/VoIPService$17;

    invoke-direct {v0, p0}, Lorg/telegram/messenger/voip/VoIPService$17;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;J)V

    .line 1272
    :cond_1
    return-void
.end method

.method private startOutgoingCall()V
    .locals 5

    .prologue
    const/16 v3, 0x100

    .line 463
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->configureDeviceForCall()V

    .line 464
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->showNotification()V

    .line 465
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->startConnectingSound()V

    .line 466
    const/16 v2, 0xe

    invoke-direct {p0, v2}, Lorg/telegram/messenger/voip/VoIPService;->dispatchStateChanged(I)V

    .line 467
    new-instance v2, Lorg/telegram/messenger/voip/VoIPService$6;

    invoke-direct {v2, p0}, Lorg/telegram/messenger/voip/VoIPService$6;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    invoke-static {v2}, Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;)V

    .line 473
    new-array v1, v3, [B

    .line 474
    .local v1, "salt":[B
    sget-object v2, Lorg/telegram/messenger/Utilities;->random:Ljava/security/SecureRandom;

    invoke-virtual {v2, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 476
    new-instance v0, Lorg/telegram/tgnet/TLRPC$TL_messages_getDhConfig;

    invoke-direct {v0}, Lorg/telegram/tgnet/TLRPC$TL_messages_getDhConfig;-><init>()V

    .line 477
    .local v0, "req":Lorg/telegram/tgnet/TLRPC$TL_messages_getDhConfig;
    iput v3, v0, Lorg/telegram/tgnet/TLRPC$TL_messages_getDhConfig;->random_length:I

    .line 478
    sget v2, Lorg/telegram/messenger/MessagesStorage;->lastSecretVersion:I

    iput v2, v0, Lorg/telegram/tgnet/TLRPC$TL_messages_getDhConfig;->version:I

    .line 479
    invoke-static {}, Lorg/telegram/tgnet/ConnectionsManager;->getInstance()Lorg/telegram/tgnet/ConnectionsManager;

    move-result-object v2

    new-instance v3, Lorg/telegram/messenger/voip/VoIPService$7;

    invoke-direct {v3, p0}, Lorg/telegram/messenger/voip/VoIPService$7;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    const/4 v4, 0x2

    invoke-virtual {v2, v0, v3, v4}, Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;I)I

    move-result v2

    iput v2, p0, Lorg/telegram/messenger/voip/VoIPService;->callReqId:I

    .line 590
    return-void
.end method

.method private startRatingActivity()V
    .locals 6

    .prologue
    .line 983
    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lorg/telegram/ui/VoIPFeedbackActivity;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v3, "call_id"

    iget-object v4, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v4, v4, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    .line 984
    invoke-virtual {v2, v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "call_access_hash"

    iget-object v4, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v4, v4, Lorg/telegram/tgnet/TLRPC$PhoneCall;->access_hash:J

    .line 985
    invoke-virtual {v2, v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v2

    const/high16 v3, 0x30000000

    .line 986
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v2

    const/4 v3, 0x0

    .line 983
    invoke-static {p0, v1, v2, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 986
    invoke-virtual {v1}, Landroid/app/PendingIntent;->send()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 990
    :goto_0
    return-void

    .line 987
    :catch_0
    move-exception v0

    .line 988
    .local v0, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "Error starting incall activity"

    invoke-static {v1, v0}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private startRinging()V
    .locals 14

    .prologue
    .line 624
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "starting ringing for call "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v10, v9, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V

    .line 625
    const/16 v8, 0xf

    invoke-direct {p0, v8}, Lorg/telegram/messenger/voip/VoIPService;->dispatchStateChanged(I)V

    .line 628
    sget-object v8, Lorg/telegram/messenger/ApplicationLoader;->Notifications:Ljava/lang/String;

    const/4 v9, 0x0

    invoke-virtual {p0, v8, v9}, Lorg/telegram/messenger/voip/VoIPService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 629
    .local v5, "prefs":Landroid/content/SharedPreferences;
    new-instance v8, Landroid/media/MediaPlayer;

    invoke-direct {v8}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v8, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    .line 630
    iget-object v8, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    new-instance v9, Lorg/telegram/messenger/voip/VoIPService$9;

    invoke-direct {v9, p0}, Lorg/telegram/messenger/voip/VoIPService$9;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    invoke-virtual {v8, v9}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 636
    iget-object v8, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 637
    iget-object v8, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    const/4 v9, 0x2

    invoke-virtual {v8, v9}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 640
    :try_start_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "custom_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    iget v9, v9, Lorg/telegram/tgnet/TLRPC$User;->id:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 641
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "ringtone_path_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    iget v9, v9, Lorg/telegram/tgnet/TLRPC$User;->id:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    invoke-static {v9}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 644
    .local v4, "notificationUri":Ljava/lang/String;
    :goto_0
    iget-object v8, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {v8, p0, v9}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 645
    iget-object v8, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v8}, Landroid/media/MediaPlayer;->prepareAsync()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 653
    .end local v4    # "notificationUri":Ljava/lang/String;
    :cond_0
    :goto_1
    const-string/jumbo v8, "audio"

    invoke-virtual {p0, v8}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 655
    .local v0, "am":Landroid/media/AudioManager;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "custom_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    iget v9, v9, Lorg/telegram/tgnet/TLRPC$User;->id:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 656
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "calls_vibrate_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    iget v9, v9, Lorg/telegram/tgnet/TLRPC$User;->id:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 659
    .local v6, "vibrate":I
    :goto_2
    const/4 v8, 0x2

    if-eq v6, v8, :cond_1

    const/4 v8, 0x4

    if-eq v6, v8, :cond_1

    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v8

    const/4 v9, 0x1

    if-eq v8, v9, :cond_2

    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v8

    const/4 v9, 0x2

    if-eq v8, v9, :cond_2

    :cond_1
    const/4 v8, 0x4

    if-ne v6, v8, :cond_4

    .line 660
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_4

    .line 661
    :cond_2
    const-string/jumbo v8, "vibrator"

    invoke-virtual {p0, v8}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/os/Vibrator;

    iput-object v8, p0, Lorg/telegram/messenger/voip/VoIPService;->vibrator:Landroid/os/Vibrator;

    .line 662
    const-wide/16 v2, 0x2bc

    .line 663
    .local v2, "duration":J
    const/4 v8, 0x1

    if-ne v6, v8, :cond_7

    .line 664
    const-wide/16 v8, 0x2

    div-long/2addr v2, v8

    .line 667
    :cond_3
    :goto_3
    iget-object v8, p0, Lorg/telegram/messenger/voip/VoIPService;->vibrator:Landroid/os/Vibrator;

    const/4 v9, 0x3

    new-array v9, v9, [J

    const/4 v10, 0x0

    const-wide/16 v12, 0x0

    aput-wide v12, v9, v10

    const/4 v10, 0x1

    aput-wide v2, v9, v10

    const/4 v10, 0x2

    const-wide/16 v12, 0x1f4

    aput-wide v12, v9, v10

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/os/Vibrator;->vibrate([JI)V

    .line 670
    .end local v2    # "duration":J
    :cond_4
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x15

    if-lt v8, v9, :cond_8

    const-string/jumbo v8, "keyguard"

    invoke-virtual {p0, v8}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/app/KeyguardManager;

    invoke-virtual {v8}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v8

    if-nez v8, :cond_8

    invoke-static {p0}, Landroid/support/v4/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroid/support/v4/app/NotificationManagerCompat;

    move-result-object v8

    invoke-virtual {v8}, Landroid/support/v4/app/NotificationManagerCompat;->areNotificationsEnabled()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 671
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->showIncomingNotification()V

    .line 672
    const-string/jumbo v8, "Showing incoming call notification"

    invoke-static {v8}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V

    .line 682
    :goto_4
    return-void

    .line 643
    .end local v0    # "am":Landroid/media/AudioManager;
    .end local v6    # "vibrate":I
    :cond_5
    :try_start_1
    const-string/jumbo v8, "CallsRingtonePath"

    const/4 v9, 0x1

    invoke-static {v9}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    .restart local v4    # "notificationUri":Ljava/lang/String;
    goto/16 :goto_0

    .line 646
    .end local v4    # "notificationUri":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 647
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {v1}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/Throwable;)V

    .line 648
    iget-object v8, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    if-eqz v8, :cond_0

    .line 649
    iget-object v8, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v8}, Landroid/media/MediaPlayer;->release()V

    .line 650
    const/4 v8, 0x0

    iput-object v8, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    goto/16 :goto_1

    .line 658
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "am":Landroid/media/AudioManager;
    :cond_6
    const-string/jumbo v8, "vibrate_calls"

    const/4 v9, 0x0

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    .restart local v6    # "vibrate":I
    goto/16 :goto_2

    .line 665
    .restart local v2    # "duration":J
    :cond_7
    const/4 v8, 0x3

    if-ne v6, v8, :cond_3

    .line 666
    const-wide/16 v8, 0x2

    mul-long/2addr v2, v8

    goto :goto_3

    .line 674
    .end local v2    # "duration":J
    :cond_8
    const-string/jumbo v8, "Starting incall activity for incoming call"

    invoke-static {v8}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V

    .line 676
    const/16 v8, 0x3039

    :try_start_2
    new-instance v9, Landroid/content/Intent;

    const-class v10, Lorg/telegram/ui/VoIPActivity;

    invoke-direct {v9, p0, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v10, 0x10000000

    invoke-virtual {v9, v10}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v9

    const/4 v10, 0x0

    invoke-static {p0, v8, v9, v10}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/PendingIntent;->send()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_4

    .line 677
    :catch_1
    move-exception v7

    .line 678
    .local v7, "x":Ljava/lang/Exception;
    const-string/jumbo v8, "Error starting incall activity"

    invoke-static {v8, v7}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_4
.end method

.method private updateBluetoothHeadsetState(Z)V
    .locals 4
    .param p1, "connected"    # Z

    .prologue
    .line 1454
    iget-boolean v2, p0, Lorg/telegram/messenger/voip/VoIPService;->isBtHeadsetConnected:Z

    if-ne p1, v2, :cond_1

    .line 1464
    :cond_0
    return-void

    .line 1456
    :cond_1
    iput-boolean p1, p0, Lorg/telegram/messenger/voip/VoIPService;->isBtHeadsetConnected:Z

    .line 1457
    const-string/jumbo v2, "audio"

    invoke-virtual {p0, v2}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 1458
    .local v0, "am":Landroid/media/AudioManager;
    if-eqz p1, :cond_2

    .line 1459
    invoke-virtual {v0}, Landroid/media/AudioManager;->startBluetoothSco()V

    .line 1462
    :goto_0
    iget-object v2, p0, Lorg/telegram/messenger/voip/VoIPService;->stateListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/telegram/messenger/voip/VoIPService$StateListener;

    .line 1463
    .local v1, "l":Lorg/telegram/messenger/voip/VoIPService$StateListener;
    invoke-interface {v1}, Lorg/telegram/messenger/voip/VoIPService$StateListener;->onAudioSettingsChanged()V

    goto :goto_1

    .line 1461
    .end local v1    # "l":Lorg/telegram/messenger/voip/VoIPService$StateListener;
    :cond_2
    invoke-virtual {v0}, Landroid/media/AudioManager;->stopBluetoothSco()V

    goto :goto_0
.end method

.method private updateNetworkType()V
    .locals 4

    .prologue
    .line 1405
    const-string/jumbo v3, "connectivity"

    invoke-virtual {p0, v3}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 1406
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 1407
    .local v1, "info":Landroid/net/NetworkInfo;
    iput-object v1, p0, Lorg/telegram/messenger/voip/VoIPService;->lastNetInfo:Landroid/net/NetworkInfo;

    .line 1408
    const/4 v2, 0x0

    .line 1409
    .local v2, "type":I
    if-eqz v1, :cond_0

    .line 1410
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 1448
    :cond_0
    :goto_0
    iget-object v3, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    if-eqz v3, :cond_1

    .line 1449
    iget-object v3, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v3, v2}, Lorg/telegram/messenger/voip/VoIPController;->setNetworkType(I)V

    .line 1451
    :cond_1
    return-void

    .line 1412
    :sswitch_0
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 1436
    :pswitch_0
    const/16 v2, 0xb

    .line 1437
    goto :goto_0

    .line 1414
    :pswitch_1
    const/4 v2, 0x1

    .line 1415
    goto :goto_0

    .line 1418
    :pswitch_2
    const/4 v2, 0x2

    .line 1419
    goto :goto_0

    .line 1422
    :pswitch_3
    const/4 v2, 0x3

    .line 1423
    goto :goto_0

    .line 1430
    :pswitch_4
    const/4 v2, 0x4

    .line 1431
    goto :goto_0

    .line 1433
    :pswitch_5
    const/4 v2, 0x5

    .line 1434
    goto :goto_0

    .line 1441
    :sswitch_1
    const/4 v2, 0x6

    .line 1442
    goto :goto_0

    .line 1444
    :sswitch_2
    const/4 v2, 0x7

    goto :goto_0

    .line 1410
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x9 -> :sswitch_2
    .end sparse-switch

    .line 1412
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method private updateStats()V
    .locals 14

    .prologue
    .line 1556
    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    iget-object v10, p0, Lorg/telegram/messenger/voip/VoIPService;->stats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    invoke-virtual {v5, v10}, Lorg/telegram/messenger/voip/VoIPController;->getStats(Lorg/telegram/messenger/voip/VoIPController$Stats;)V

    .line 1557
    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->stats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    iget-wide v10, v5, Lorg/telegram/messenger/voip/VoIPController$Stats;->bytesSentWifi:J

    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->prevStats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    iget-wide v12, v5, Lorg/telegram/messenger/voip/VoIPController$Stats;->bytesSentWifi:J

    sub-long v8, v10, v12

    .line 1558
    .local v8, "wifiSentDiff":J
    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->stats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    iget-wide v10, v5, Lorg/telegram/messenger/voip/VoIPController$Stats;->bytesRecvdWifi:J

    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->prevStats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    iget-wide v12, v5, Lorg/telegram/messenger/voip/VoIPController$Stats;->bytesRecvdWifi:J

    sub-long v6, v10, v12

    .line 1559
    .local v6, "wifiRecvdDiff":J
    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->stats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    iget-wide v10, v5, Lorg/telegram/messenger/voip/VoIPController$Stats;->bytesSentMobile:J

    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->prevStats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    iget-wide v12, v5, Lorg/telegram/messenger/voip/VoIPController$Stats;->bytesSentMobile:J

    sub-long v2, v10, v12

    .line 1560
    .local v2, "mobileSentDiff":J
    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->stats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    iget-wide v10, v5, Lorg/telegram/messenger/voip/VoIPController$Stats;->bytesRecvdMobile:J

    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->prevStats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    iget-wide v12, v5, Lorg/telegram/messenger/voip/VoIPController$Stats;->bytesRecvdMobile:J

    sub-long v0, v10, v12

    .line 1561
    .local v0, "mobileRecvdDiff":J
    iget-object v4, p0, Lorg/telegram/messenger/voip/VoIPService;->stats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    .line 1562
    .local v4, "tmp":Lorg/telegram/messenger/voip/VoIPController$Stats;
    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->prevStats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    iput-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->stats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    .line 1563
    iput-object v4, p0, Lorg/telegram/messenger/voip/VoIPService;->prevStats:Lorg/telegram/messenger/voip/VoIPController$Stats;

    .line 1564
    const-wide/16 v10, 0x0

    cmp-long v5, v8, v10

    if-lez v5, :cond_0

    .line 1565
    invoke-static {}, Lorg/telegram/messenger/StatsController;->getInstance()Lorg/telegram/messenger/StatsController;

    move-result-object v5

    const/4 v10, 0x1

    const/4 v11, 0x0

    invoke-virtual {v5, v10, v11, v8, v9}, Lorg/telegram/messenger/StatsController;->incrementSentBytesCount(IIJ)V

    .line 1566
    :cond_0
    const-wide/16 v10, 0x0

    cmp-long v5, v6, v10

    if-lez v5, :cond_1

    .line 1567
    invoke-static {}, Lorg/telegram/messenger/StatsController;->getInstance()Lorg/telegram/messenger/StatsController;

    move-result-object v5

    const/4 v10, 0x1

    const/4 v11, 0x0

    invoke-virtual {v5, v10, v11, v6, v7}, Lorg/telegram/messenger/StatsController;->incrementReceivedBytesCount(IIJ)V

    .line 1568
    :cond_1
    const-wide/16 v10, 0x0

    cmp-long v5, v2, v10

    if-lez v5, :cond_2

    .line 1569
    invoke-static {}, Lorg/telegram/messenger/StatsController;->getInstance()Lorg/telegram/messenger/StatsController;

    move-result-object v10

    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->lastNetInfo:Landroid/net/NetworkInfo;

    if-eqz v5, :cond_4

    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->lastNetInfo:Landroid/net/NetworkInfo;

    invoke-virtual {v5}, Landroid/net/NetworkInfo;->isRoaming()Z

    move-result v5

    if-eqz v5, :cond_4

    const/4 v5, 0x2

    :goto_0
    const/4 v11, 0x0

    invoke-virtual {v10, v5, v11, v2, v3}, Lorg/telegram/messenger/StatsController;->incrementSentBytesCount(IIJ)V

    .line 1571
    :cond_2
    const-wide/16 v10, 0x0

    cmp-long v5, v0, v10

    if-lez v5, :cond_3

    .line 1572
    invoke-static {}, Lorg/telegram/messenger/StatsController;->getInstance()Lorg/telegram/messenger/StatsController;

    move-result-object v10

    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->lastNetInfo:Landroid/net/NetworkInfo;

    if-eqz v5, :cond_5

    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->lastNetInfo:Landroid/net/NetworkInfo;

    invoke-virtual {v5}, Landroid/net/NetworkInfo;->isRoaming()Z

    move-result v5

    if-eqz v5, :cond_5

    const/4 v5, 0x2

    :goto_1
    const/4 v11, 0x0

    invoke-virtual {v10, v5, v11, v0, v1}, Lorg/telegram/messenger/StatsController;->incrementReceivedBytesCount(IIJ)V

    .line 1574
    :cond_3
    return-void

    .line 1569
    :cond_4
    const/4 v5, 0x0

    goto :goto_0

    .line 1572
    :cond_5
    const/4 v5, 0x0

    goto :goto_1
.end method


# virtual methods
.method public acceptIncomingCall()V
    .locals 3

    .prologue
    .line 685
    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->stopRinging()V

    .line 686
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->showNotification()V

    .line 687
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->configureDeviceForCall()V

    .line 688
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->startConnectingSound()V

    .line 689
    const/16 v1, 0xc

    invoke-direct {p0, v1}, Lorg/telegram/messenger/voip/VoIPService;->dispatchStateChanged(I)V

    .line 690
    new-instance v1, Lorg/telegram/messenger/voip/VoIPService$10;

    invoke-direct {v1, p0}, Lorg/telegram/messenger/voip/VoIPService$10;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    invoke-static {v1}, Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;)V

    .line 696
    new-instance v0, Lorg/telegram/tgnet/TLRPC$TL_messages_getDhConfig;

    invoke-direct {v0}, Lorg/telegram/tgnet/TLRPC$TL_messages_getDhConfig;-><init>()V

    .line 697
    .local v0, "req":Lorg/telegram/tgnet/TLRPC$TL_messages_getDhConfig;
    const/16 v1, 0x100

    iput v1, v0, Lorg/telegram/tgnet/TLRPC$TL_messages_getDhConfig;->random_length:I

    .line 698
    sget v1, Lorg/telegram/messenger/MessagesStorage;->lastSecretVersion:I

    iput v1, v0, Lorg/telegram/tgnet/TLRPC$TL_messages_getDhConfig;->version:I

    .line 699
    invoke-static {}, Lorg/telegram/tgnet/ConnectionsManager;->getInstance()Lorg/telegram/tgnet/ConnectionsManager;

    move-result-object v1

    new-instance v2, Lorg/telegram/messenger/voip/VoIPService$11;

    invoke-direct {v2, p0}, Lorg/telegram/messenger/voip/VoIPService$11;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    invoke-virtual {v1, v0, v2}, Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;)I

    .line 773
    return-void
.end method

.method public debugCtl(II)V
    .locals 1
    .param p1, "request"    # I
    .param p2, "param"    # I

    .prologue
    .line 1547
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    if-eqz v0, :cond_0

    .line 1548
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v0, p1, p2}, Lorg/telegram/messenger/voip/VoIPController;->debugCtl(II)V

    .line 1549
    :cond_0
    return-void
.end method

.method public declineIncomingCall()V
    .locals 2

    .prologue
    .line 776
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/telegram/messenger/voip/VoIPService;->declineIncomingCall(ILjava/lang/Runnable;)V

    .line 777
    return-void
.end method

.method public declineIncomingCall(ILjava/lang/Runnable;)V
    .locals 10
    .param p1, "reason"    # I
    .param p2, "onDone"    # Ljava/lang/Runnable;

    .prologue
    const/4 v2, 0x1

    const/16 v6, 0xa

    const/4 v4, 0x0

    .line 780
    iget v3, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    const/16 v5, 0xe

    if-ne v3, v5, :cond_1

    .line 781
    invoke-direct {p0, v6}, Lorg/telegram/messenger/voip/VoIPService;->dispatchStateChanged(I)V

    .line 782
    iput-boolean v2, p0, Lorg/telegram/messenger/voip/VoIPService;->endCallAfterRequest:Z

    .line 861
    :cond_0
    :goto_0
    return-void

    .line 785
    :cond_1
    iget v3, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    if-eq v3, v6, :cond_0

    iget v3, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    const/16 v5, 0xb

    if-eq v3, v5, :cond_0

    .line 787
    invoke-direct {p0, v6}, Lorg/telegram/messenger/voip/VoIPService;->dispatchStateChanged(I)V

    .line 788
    iget-object v3, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    if-nez v3, :cond_3

    .line 789
    if-eqz p2, :cond_2

    .line 790
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 791
    :cond_2
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->callEnded()V

    .line 792
    iget v3, p0, Lorg/telegram/messenger/voip/VoIPService;->callReqId:I

    if-eqz v3, :cond_0

    .line 793
    invoke-static {}, Lorg/telegram/tgnet/ConnectionsManager;->getInstance()Lorg/telegram/tgnet/ConnectionsManager;

    move-result-object v3

    iget v5, p0, Lorg/telegram/messenger/voip/VoIPService;->callReqId:I

    invoke-virtual {v3, v5, v4}, Lorg/telegram/tgnet/ConnectionsManager;->cancelRequest(IZ)V

    .line 794
    iput v4, p0, Lorg/telegram/messenger/voip/VoIPService;->callReqId:I

    goto :goto_0

    .line 798
    :cond_3
    new-instance v0, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;

    invoke-direct {v0}, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;-><init>()V

    .line 799
    .local v0, "req":Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;
    new-instance v3, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    invoke-direct {v3}, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;-><init>()V

    iput-object v3, v0, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    .line 800
    iget-object v3, v0, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v6, v5, Lorg/telegram/tgnet/TLRPC$PhoneCall;->access_hash:J

    iput-wide v6, v3, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;->access_hash:J

    .line 801
    iget-object v3, v0, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    iget-object v5, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v6, v5, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    iput-wide v6, v3, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;->id:J

    .line 802
    iget-object v3, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    if-eqz v3, :cond_5

    iget-boolean v3, p0, Lorg/telegram/messenger/voip/VoIPService;->controllerStarted:Z

    if-eqz v3, :cond_5

    iget-object v3, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v3}, Lorg/telegram/messenger/voip/VoIPController;->getCallDuration()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    long-to-int v3, v6

    :goto_1
    iput v3, v0, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->duration:I

    .line 803
    iget-object v3, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    if-eqz v3, :cond_6

    iget-boolean v3, p0, Lorg/telegram/messenger/voip/VoIPService;->controllerStarted:Z

    if-eqz v3, :cond_6

    iget-object v3, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v3}, Lorg/telegram/messenger/voip/VoIPController;->getPreferredRelayID()J

    move-result-wide v6

    :goto_2
    iput-wide v6, v0, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->connection_id:J

    .line 804
    packed-switch p1, :pswitch_data_0

    .line 816
    new-instance v3, Lorg/telegram/tgnet/TLRPC$TL_phoneCallDiscardReasonHangup;

    invoke-direct {v3}, Lorg/telegram/tgnet/TLRPC$TL_phoneCallDiscardReasonHangup;-><init>()V

    iput-object v3, v0, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->reason:Lorg/telegram/tgnet/TLRPC$PhoneCallDiscardReason;

    .line 819
    :goto_3
    invoke-static {}, Lorg/telegram/tgnet/ConnectionsManager;->getInstance()Lorg/telegram/tgnet/ConnectionsManager;

    move-result-object v3

    invoke-virtual {v3}, Lorg/telegram/tgnet/ConnectionsManager;->getConnectionState()I

    move-result v3

    const/4 v5, 0x3

    if-eq v3, v5, :cond_7

    .line 821
    .local v2, "wasNotConnected":Z
    :goto_4
    if-eqz v2, :cond_8

    .line 822
    if-eqz p2, :cond_4

    .line 823
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 824
    :cond_4
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->callEnded()V

    .line 825
    const/4 v1, 0x0

    .line 842
    .local v1, "stopper":Ljava/lang/Runnable;
    :goto_5
    invoke-static {}, Lorg/telegram/tgnet/ConnectionsManager;->getInstance()Lorg/telegram/tgnet/ConnectionsManager;

    move-result-object v3

    new-instance v4, Lorg/telegram/messenger/voip/VoIPService$13;

    invoke-direct {v4, p0, v2, v1, p2}, Lorg/telegram/messenger/voip/VoIPService$13;-><init>(Lorg/telegram/messenger/voip/VoIPService;ZLjava/lang/Runnable;Ljava/lang/Runnable;)V

    const/4 v5, 0x2

    invoke-virtual {v3, v0, v4, v5}, Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;I)I

    goto/16 :goto_0

    .end local v1    # "stopper":Ljava/lang/Runnable;
    .end local v2    # "wasNotConnected":Z
    :cond_5
    move v3, v4

    .line 802
    goto :goto_1

    .line 803
    :cond_6
    const-wide/16 v6, 0x0

    goto :goto_2

    .line 806
    :pswitch_0
    new-instance v3, Lorg/telegram/tgnet/TLRPC$TL_phoneCallDiscardReasonDisconnect;

    invoke-direct {v3}, Lorg/telegram/tgnet/TLRPC$TL_phoneCallDiscardReasonDisconnect;-><init>()V

    iput-object v3, v0, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->reason:Lorg/telegram/tgnet/TLRPC$PhoneCallDiscardReason;

    goto :goto_3

    .line 809
    :pswitch_1
    new-instance v3, Lorg/telegram/tgnet/TLRPC$TL_phoneCallDiscardReasonMissed;

    invoke-direct {v3}, Lorg/telegram/tgnet/TLRPC$TL_phoneCallDiscardReasonMissed;-><init>()V

    iput-object v3, v0, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->reason:Lorg/telegram/tgnet/TLRPC$PhoneCallDiscardReason;

    goto :goto_3

    .line 812
    :pswitch_2
    new-instance v3, Lorg/telegram/tgnet/TLRPC$TL_phoneCallDiscardReasonBusy;

    invoke-direct {v3}, Lorg/telegram/tgnet/TLRPC$TL_phoneCallDiscardReasonBusy;-><init>()V

    iput-object v3, v0, Lorg/telegram/tgnet/TLRPC$TL_phone_discardCall;->reason:Lorg/telegram/tgnet/TLRPC$PhoneCallDiscardReason;

    goto :goto_3

    :cond_7
    move v2, v4

    .line 819
    goto :goto_4

    .line 827
    .restart local v2    # "wasNotConnected":Z
    :cond_8
    new-instance v1, Lorg/telegram/messenger/voip/VoIPService$12;

    invoke-direct {v1, p0, p2}, Lorg/telegram/messenger/voip/VoIPService$12;-><init>(Lorg/telegram/messenger/voip/VoIPService;Ljava/lang/Runnable;)V

    .line 840
    .restart local v1    # "stopper":Ljava/lang/Runnable;
    const-string/jumbo v3, "hangup_ui_timeout"

    const-wide/high16 v4, 0x4014000000000000L    # 5.0

    invoke-static {v3, v4, v5}, Lorg/telegram/messenger/voip/VoIPServerConfig;->getDouble(Ljava/lang/String;D)D

    move-result-wide v4

    const-wide v6, 0x408f400000000000L    # 1000.0

    mul-double/2addr v4, v6

    double-to-int v3, v4

    int-to-long v4, v3

    invoke-static {v1, v4, v5}, Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;J)V

    goto :goto_5

    .line 804
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public varargs didReceivedNotification(I[Ljava/lang/Object;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1624
    sget v0, Lorg/telegram/messenger/NotificationCenter;->appDidLogout:I

    if-ne p1, v0, :cond_0

    .line 1625
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->callEnded()V

    .line 1627
    :cond_0
    return-void
.end method

.method public getCallDuration()J
    .locals 2

    .prologue
    .line 439
    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controllerStarted:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    if-nez v0, :cond_1

    .line 440
    :cond_0
    iget-wide v0, p0, Lorg/telegram/messenger/voip/VoIPService;->lastKnownDuration:J

    .line 441
    :goto_0
    return-wide v0

    :cond_1
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v0}, Lorg/telegram/messenger/voip/VoIPController;->getCallDuration()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/telegram/messenger/voip/VoIPService;->lastKnownDuration:J

    goto :goto_0
.end method

.method public getCallState()I
    .locals 1

    .prologue
    .line 1615
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    return v0
.end method

.method public getDebugString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 435
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v0}, Lorg/telegram/messenger/voip/VoIPController;->getDebugString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEncryptionKey()[B
    .locals 1

    .prologue
    .line 1005
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->authKey:[B

    return-object v0
.end method

.method public getGA()[B
    .locals 1

    .prologue
    .line 1619
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->g_a:[B

    return-object v0
.end method

.method public getLastError()I
    .locals 1

    .prologue
    .line 1552
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->lastError:I

    return v0
.end method

.method public getUser()Lorg/telegram/tgnet/TLRPC$User;
    .locals 1

    .prologue
    .line 423
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    return-object v0
.end method

.method public hangUp()V
    .locals 2

    .prologue
    .line 445
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    const/16 v1, 0x10

    if-eq v0, v1, :cond_0

    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    const/16 v1, 0xd

    if-ne v0, v1, :cond_1

    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->isOutgoing:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x3

    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/telegram/messenger/voip/VoIPService;->declineIncomingCall(ILjava/lang/Runnable;)V

    .line 446
    return-void

    .line 445
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public hangUp(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "onDone"    # Ljava/lang/Runnable;

    .prologue
    .line 449
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    const/16 v1, 0x10

    if-eq v0, v1, :cond_0

    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    const/16 v1, 0xd

    if-ne v0, v1, :cond_1

    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->isOutgoing:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x3

    :goto_0
    invoke-virtual {p0, v0, p1}, Lorg/telegram/messenger/voip/VoIPService;->declineIncomingCall(ILjava/lang/Runnable;)V

    .line 450
    return-void

    .line 449
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public hasEarpiece()Z
    .locals 11

    .prologue
    const/4 v7, 0x1

    .line 1586
    const-string/jumbo v6, "phone"

    invoke-virtual {p0, v6}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/telephony/TelephonyManager;

    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v6

    if-eqz v6, :cond_0

    move v6, v7

    .line 1611
    :goto_0
    return v6

    .line 1588
    :cond_0
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->mHasEarpiece:Ljava/lang/Boolean;

    if-eqz v6, :cond_1

    .line 1589
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->mHasEarpiece:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    goto :goto_0

    .line 1594
    :cond_1
    :try_start_0
    const-string/jumbo v6, "audio"

    invoke-virtual {p0, v6}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 1595
    .local v0, "am":Landroid/media/AudioManager;
    const-class v6, Landroid/media/AudioManager;

    const-string/jumbo v7, "getDevicesForStream"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v10, v8, v9

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 1596
    .local v5, "method":Ljava/lang/reflect/Method;
    const-class v6, Landroid/media/AudioManager;

    const-string/jumbo v7, "DEVICE_OUT_EARPIECE"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 1597
    .local v4, "field":Ljava/lang/reflect/Field;
    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    .line 1598
    .local v2, "earpieceFlag":I
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v5, v0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1601
    .local v1, "bitmaskResult":I
    and-int v6, v1, v2

    if-ne v6, v2, :cond_2

    .line 1602
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->mHasEarpiece:Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 1611
    .end local v0    # "am":Landroid/media/AudioManager;
    .end local v1    # "bitmaskResult":I
    .end local v2    # "earpieceFlag":I
    .end local v4    # "field":Ljava/lang/reflect/Field;
    .end local v5    # "method":Ljava/lang/reflect/Method;
    :goto_1
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->mHasEarpiece:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    goto :goto_0

    .line 1604
    .restart local v0    # "am":Landroid/media/AudioManager;
    .restart local v1    # "bitmaskResult":I
    .restart local v2    # "earpieceFlag":I
    .restart local v4    # "field":Ljava/lang/reflect/Field;
    .restart local v5    # "method":Ljava/lang/reflect/Method;
    :cond_2
    :try_start_1
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->mHasEarpiece:Ljava/lang/Boolean;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 1606
    .end local v0    # "am":Landroid/media/AudioManager;
    .end local v1    # "bitmaskResult":I
    .end local v2    # "earpieceFlag":I
    .end local v4    # "field":Ljava/lang/reflect/Field;
    .end local v5    # "method":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 1607
    .local v3, "error":Ljava/lang/Throwable;
    const-string/jumbo v6, "Error while checking earpiece! "

    invoke-static {v6, v3}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1608
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->mHasEarpiece:Ljava/lang/Boolean;

    goto :goto_1
.end method

.method public isBluetoothHeadsetConnected()Z
    .locals 1

    .prologue
    .line 1467
    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->isBtHeadsetConnected:Z

    return v0
.end method

.method public isMicMute()Z
    .locals 1

    .prologue
    .line 431
    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->micMute:Z

    return v0
.end method

.method public isOutgoing()Z
    .locals 1

    .prologue
    .line 1371
    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->isOutgoing:Z

    return v0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 1402
    return-void
.end method

.method public onAudioFocusChange(I)V
    .locals 1
    .param p1, "focusChange"    # I

    .prologue
    const/4 v0, 0x1

    .line 1500
    if-ne p1, v0, :cond_0

    .line 1501
    iput-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->haveAudioFocus:Z

    .line 1505
    :goto_0
    return-void

    .line 1503
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->haveAudioFocus:Z

    goto :goto_0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 237
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCallUpdated(Lorg/telegram/tgnet/TLRPC$PhoneCall;)V
    .locals 14
    .param p1, "call"    # Lorg/telegram/tgnet/TLRPC$PhoneCall;

    .prologue
    .line 875
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    if-nez v0, :cond_1

    .line 876
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->pendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 979
    :cond_0
    :goto_0
    return-void

    .line 879
    :cond_1
    if-eqz p1, :cond_0

    .line 881
    iget-wide v0, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    iget-object v2, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v2, v2, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2

    .line 882
    sget-boolean v0, Lorg/telegram/messenger/BuildVars;->DEBUG_VERSION:Z

    if-eqz v0, :cond_0

    .line 883
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "onCallUpdated called with wrong call id (got "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", expected "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v2, v1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/telegram/messenger/FileLog;->w(Ljava/lang/String;)V

    goto :goto_0

    .line 886
    :cond_2
    iget-wide v0, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->access_hash:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_3

    .line 887
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v0, v0, Lorg/telegram/tgnet/TLRPC$PhoneCall;->access_hash:J

    iput-wide v0, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->access_hash:J

    .line 888
    :cond_3
    sget-boolean v0, Lorg/telegram/messenger/BuildVars;->DEBUG_VERSION:Z

    if-eqz v0, :cond_4

    .line 889
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Call updated: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V

    .line 890
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->dumpCallObject()V

    .line 892
    :cond_4
    iput-object p1, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    .line 893
    instance-of v0, p1, Lorg/telegram/tgnet/TLRPC$TL_phoneCallDiscarded;

    if-eqz v0, :cond_6

    .line 894
    iget-boolean v0, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->need_debug:Z

    iput-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->needSendDebugLog:Z

    .line 895
    const-string/jumbo v0, "call discarded, stopping service"

    invoke-static {v0}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V

    .line 896
    iget-object v0, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->reason:Lorg/telegram/tgnet/TLRPC$PhoneCallDiscardReason;

    instance-of v0, v0, Lorg/telegram/tgnet/TLRPC$TL_phoneCallDiscardReasonBusy;

    if-eqz v0, :cond_5

    .line 897
    const/16 v0, 0x11

    invoke-direct {p0, v0}, Lorg/telegram/messenger/voip/VoIPService;->dispatchStateChanged(I)V

    .line 898
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->playingSound:Z

    .line 899
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lorg/telegram/messenger/voip/VoIPService;->spBusyId:I

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    .line 900
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->afterSoundRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x5dc

    invoke-static {v0, v2, v3}, Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;J)V

    .line 901
    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->stopSelf()V

    .line 905
    :goto_1
    iget-boolean v0, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->need_rating:Z

    if-eqz v0, :cond_0

    .line 906
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->startRatingActivity()V

    goto/16 :goto_0

    .line 903
    :cond_5
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->callEnded()V

    goto :goto_1

    .line 908
    :cond_6
    instance-of v0, p1, Lorg/telegram/tgnet/TLRPC$TL_phoneCall;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->authKey:[B

    if-nez v0, :cond_e

    .line 909
    iget-object v0, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->g_a_or_b:[B

    if-nez v0, :cond_7

    .line 910
    const-string/jumbo v0, "stopping VoIP service, Ga == null"

    invoke-static {v0}, Lorg/telegram/messenger/FileLog;->w(Ljava/lang/String;)V

    .line 911
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->callFailed()V

    goto/16 :goto_0

    .line 914
    :cond_7
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->g_a_hash:[B

    iget-object v1, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->g_a_or_b:[B

    const/4 v2, 0x0

    iget-object v3, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->g_a_or_b:[B

    array-length v3, v3

    invoke-static {v1, v2, v3}, Lorg/telegram/messenger/Utilities;->computeSHA256([BII)[B

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_8

    .line 915
    const-string/jumbo v0, "stopping VoIP service, Ga hash doesn\'t match"

    invoke-static {v0}, Lorg/telegram/messenger/FileLog;->w(Ljava/lang/String;)V

    .line 916
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->callFailed()V

    goto/16 :goto_0

    .line 919
    :cond_8
    iget-object v0, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->g_a_or_b:[B

    iput-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->g_a:[B

    .line 920
    new-instance v12, Ljava/math/BigInteger;

    const/4 v0, 0x1

    iget-object v1, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->g_a_or_b:[B

    invoke-direct {v12, v0, v1}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 921
    .local v12, "g_a":Ljava/math/BigInteger;
    new-instance v13, Ljava/math/BigInteger;

    const/4 v0, 0x1

    sget-object v1, Lorg/telegram/messenger/MessagesStorage;->secretPBytes:[B

    invoke-direct {v13, v0, v1}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 923
    .local v13, "p":Ljava/math/BigInteger;
    invoke-static {v12, v13}, Lorg/telegram/messenger/Utilities;->isGoodGaAndGb(Ljava/math/BigInteger;Ljava/math/BigInteger;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 924
    const-string/jumbo v0, "stopping VoIP service, bad Ga and Gb (accepting)"

    invoke-static {v0}, Lorg/telegram/messenger/FileLog;->w(Ljava/lang/String;)V

    .line 925
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->callFailed()V

    goto/16 :goto_0

    .line 928
    :cond_9
    new-instance v0, Ljava/math/BigInteger;

    const/4 v1, 0x1

    iget-object v2, p0, Lorg/telegram/messenger/voip/VoIPService;->a_or_b:[B

    invoke-direct {v0, v1, v2}, Ljava/math/BigInteger;-><init>(I[B)V

    invoke-virtual {v12, v0, v13}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v12

    .line 930
    invoke-virtual {v12}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v8

    .line 931
    .local v8, "authKey":[B
    array-length v0, v8

    const/16 v1, 0x100

    if-le v0, v1, :cond_b

    .line 932
    const/16 v0, 0x100

    new-array v11, v0, [B

    .line 933
    .local v11, "correctedAuth":[B
    array-length v0, v8

    add-int/lit16 v0, v0, -0x100

    const/4 v1, 0x0

    const/16 v2, 0x100

    invoke-static {v8, v0, v11, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 934
    move-object v8, v11

    .line 943
    .end local v11    # "correctedAuth":[B
    :cond_a
    :goto_2
    invoke-static {v8}, Lorg/telegram/messenger/Utilities;->computeSHA1([B)[B

    move-result-object v9

    .line 944
    .local v9, "authKeyHash":[B
    const/16 v0, 0x8

    new-array v10, v0, [B

    .line 945
    .local v10, "authKeyId":[B
    array-length v0, v9

    add-int/lit8 v0, v0, -0x8

    const/4 v1, 0x0

    const/16 v2, 0x8

    invoke-static {v9, v0, v10, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 946
    iput-object v8, p0, Lorg/telegram/messenger/voip/VoIPService;->authKey:[B

    .line 947
    invoke-static {v10}, Lorg/telegram/messenger/Utilities;->bytesToLong([B)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/telegram/messenger/voip/VoIPService;->keyFingerprint:J

    .line 949
    iget-wide v0, p0, Lorg/telegram/messenger/voip/VoIPService;->keyFingerprint:J

    iget-wide v2, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->key_fingerprint:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_d

    .line 950
    const-string/jumbo v0, "key fingerprints don\'t match"

    invoke-static {v0}, Lorg/telegram/messenger/FileLog;->w(Ljava/lang/String;)V

    .line 951
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->callFailed()V

    goto/16 :goto_0

    .line 935
    .end local v9    # "authKeyHash":[B
    .end local v10    # "authKeyId":[B
    :cond_b
    array-length v0, v8

    const/16 v1, 0x100

    if-ge v0, v1, :cond_a

    .line 936
    const/16 v0, 0x100

    new-array v11, v0, [B

    .line 937
    .restart local v11    # "correctedAuth":[B
    const/4 v0, 0x0

    array-length v1, v8

    rsub-int v1, v1, 0x100

    array-length v2, v8

    invoke-static {v8, v0, v11, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 938
    const/4 v7, 0x0

    .local v7, "a":I
    :goto_3
    array-length v0, v8

    rsub-int v0, v0, 0x100

    if-ge v7, v0, :cond_c

    .line 939
    const/4 v0, 0x0

    aput-byte v0, v8, v7

    .line 938
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 941
    :cond_c
    move-object v8, v11

    goto :goto_2

    .line 955
    .end local v7    # "a":I
    .end local v11    # "correctedAuth":[B
    .restart local v9    # "authKeyHash":[B
    .restart local v10    # "authKeyId":[B
    :cond_d
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->initiateActualEncryptedCall()V

    goto/16 :goto_0

    .line 956
    .end local v8    # "authKey":[B
    .end local v9    # "authKeyHash":[B
    .end local v10    # "authKeyId":[B
    .end local v12    # "g_a":Ljava/math/BigInteger;
    .end local v13    # "p":Ljava/math/BigInteger;
    :cond_e
    instance-of v0, p1, Lorg/telegram/tgnet/TLRPC$TL_phoneCallAccepted;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->authKey:[B

    if-nez v0, :cond_f

    .line 957
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->processAcceptedCall()V

    goto/16 :goto_0

    .line 959
    :cond_f
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    const/16 v1, 0xd

    if-ne v0, v1, :cond_0

    iget v0, p1, Lorg/telegram/tgnet/TLRPC$PhoneCall;->receive_date:I

    if-eqz v0, :cond_0

    .line 960
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lorg/telegram/messenger/voip/VoIPService;->dispatchStateChanged(I)V

    .line 961
    const-string/jumbo v0, "!!!!!! CALL RECEIVED"

    invoke-static {v0}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V

    .line 962
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    if-eqz v0, :cond_10

    .line 963
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    .line 964
    :cond_10
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lorg/telegram/messenger/voip/VoIPService;->spRingbackID:I

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    iput v0, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    .line 965
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_11

    .line 966
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    invoke-static {v0}, Lorg/telegram/messenger/AndroidUtilities;->cancelRunOnUIThread(Ljava/lang/Runnable;)V

    .line 967
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    .line 969
    :cond_11
    new-instance v0, Lorg/telegram/messenger/voip/VoIPService$14;

    invoke-direct {v0, p0}, Lorg/telegram/messenger/voip/VoIPService$14;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    iput-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    .line 976
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v1

    iget v1, v1, Lorg/telegram/messenger/MessagesController;->callRingTimeout:I

    int-to-long v2, v1

    invoke-static {v0, v2, v3}, Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;J)V

    goto/16 :goto_0
.end method

.method public onConnectionStateChanged(I)V
    .locals 8
    .param p1, "newState"    # I

    .prologue
    const/4 v3, 0x1

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    .line 1331
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 1332
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->callFailed()V

    .line 1368
    :goto_0
    return-void

    .line 1335
    :cond_0
    const/4 v0, 0x3

    if-ne p1, v0, :cond_2

    .line 1336
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    if-eqz v0, :cond_1

    .line 1337
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    .line 1338
    iput v4, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    .line 1340
    :cond_1
    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->wasEstablished:Z

    if-nez v0, :cond_2

    .line 1341
    iput-boolean v3, p0, Lorg/telegram/messenger/voip/VoIPService;->wasEstablished:Z

    .line 1342
    new-instance v0, Lorg/telegram/messenger/voip/VoIPService$19;

    invoke-direct {v0, p0}, Lorg/telegram/messenger/voip/VoIPService$19;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    const-wide/16 v6, 0x1388

    invoke-static {v0, v6, v7}, Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;J)V

    .line 1356
    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->isOutgoing:Z

    if-eqz v0, :cond_5

    .line 1357
    invoke-static {}, Lorg/telegram/messenger/StatsController;->getInstance()Lorg/telegram/messenger/StatsController;

    move-result-object v0

    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->getStatsNetworkType()I

    move-result v1

    invoke-virtual {v0, v1, v4, v3}, Lorg/telegram/messenger/StatsController;->incrementSentItemsCount(III)V

    .line 1362
    :cond_2
    :goto_1
    const/4 v0, 0x5

    if-ne p1, v0, :cond_4

    .line 1363
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    if-eqz v0, :cond_3

    .line 1364
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    .line 1365
    :cond_3
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    iget v1, p0, Lorg/telegram/messenger/voip/VoIPService;->spConnectingId:I

    const/4 v5, -0x1

    move v3, v2

    move v6, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    iput v0, p0, Lorg/telegram/messenger/voip/VoIPService;->spPlayID:I

    .line 1367
    :cond_4
    invoke-direct {p0, p1}, Lorg/telegram/messenger/voip/VoIPService;->dispatchStateChanged(I)V

    goto :goto_0

    .line 1359
    :cond_5
    invoke-static {}, Lorg/telegram/messenger/StatsController;->getInstance()Lorg/telegram/messenger/StatsController;

    move-result-object v0

    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->getStatsNetworkType()I

    move-result v1

    invoke-virtual {v0, v1, v4, v3}, Lorg/telegram/messenger/StatsController;->incrementReceivedItemsCount(III)V

    goto :goto_1
.end method

.method public onCreate()V
    .locals 15

    .prologue
    const/4 v14, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 276
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 277
    const-string/jumbo v7, "=============== VoIPService STARTING ==============="

    invoke-static {v7}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V

    .line 278
    const-string/jumbo v7, "audio"

    invoke-virtual {p0, v7}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 279
    .local v0, "am":Landroid/media/AudioManager;
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x11

    if-lt v7, v10, :cond_3

    const-string/jumbo v7, "android.media.property.OUTPUT_FRAMES_PER_BUFFER"

    invoke-virtual {v0, v7}, Landroid/media/AudioManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_3

    .line 280
    const-string/jumbo v7, "android.media.property.OUTPUT_FRAMES_PER_BUFFER"

    invoke-virtual {v0, v7}, Landroid/media/AudioManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 281
    .local v4, "outFramesPerBuffer":I
    invoke-static {v4}, Lorg/telegram/messenger/voip/VoIPController;->setNativeBufferSize(I)V

    .line 285
    .end local v4    # "outFramesPerBuffer":I
    :goto_0
    sget-object v7, Lorg/telegram/messenger/ApplicationLoader;->mainconfig:Ljava/lang/String;

    invoke-virtual {p0, v7, v9}, Lorg/telegram/messenger/voip/VoIPService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 286
    .local v5, "preferences":Landroid/content/SharedPreferences;
    const-string/jumbo v7, "voip_server_config"

    const-string/jumbo v10, "{}"

    invoke-interface {v5, v7, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/telegram/messenger/voip/VoIPServerConfig;->setConfig(Ljava/lang/String;)V

    .line 287
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    const-string/jumbo v7, "voip_server_config_updated"

    const-wide/16 v12, 0x0

    invoke-interface {v5, v7, v12, v13}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v12

    sub-long/2addr v10, v12

    const-wide/32 v12, 0x5265c00

    cmp-long v7, v10, v12

    if-lez v7, :cond_0

    .line 288
    invoke-static {}, Lorg/telegram/tgnet/ConnectionsManager;->getInstance()Lorg/telegram/tgnet/ConnectionsManager;

    move-result-object v7

    new-instance v10, Lorg/telegram/tgnet/TLRPC$TL_phone_getCallConfig;

    invoke-direct {v10}, Lorg/telegram/tgnet/TLRPC$TL_phone_getCallConfig;-><init>()V

    new-instance v11, Lorg/telegram/messenger/voip/VoIPService$3;

    invoke-direct {v11, p0, v5}, Lorg/telegram/messenger/voip/VoIPService$3;-><init>(Lorg/telegram/messenger/voip/VoIPService;Landroid/content/SharedPreferences;)V

    invoke-virtual {v7, v10, v11}, Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;)I

    .line 300
    :cond_0
    :try_start_0
    new-instance v7, Lorg/telegram/messenger/voip/VoIPController;

    invoke-direct {v7}, Lorg/telegram/messenger/voip/VoIPController;-><init>()V

    iput-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    .line 301
    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v7, p0}, Lorg/telegram/messenger/voip/VoIPController;->setConnectionStateListener(Lorg/telegram/messenger/voip/VoIPController$ConnectionStateListener;)V

    .line 303
    const-string/jumbo v7, "power"

    invoke-virtual {p0, v7}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/os/PowerManager;

    const/4 v10, 0x1

    const-string/jumbo v11, "telegram-voip"

    invoke-virtual {v7, v10, v11}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v7

    iput-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->cpuWakelock:Landroid/os/PowerManager$WakeLock;

    .line 304
    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->cpuWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v7}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 306
    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoAvailableOffCall()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v7

    :goto_1
    iput-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->btAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 308
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 309
    .local v1, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v7, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v1, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 310
    const-string/jumbo v7, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {v1, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 311
    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->btAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v7, :cond_1

    .line 312
    const-string/jumbo v7, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v1, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 313
    const-string/jumbo v7, "android.media.ACTION_SCO_AUDIO_STATE_UPDATED"

    invoke-virtual {v1, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 315
    :cond_1
    const-string/jumbo v7, "android.intent.action.PHONE_STATE"

    invoke-virtual {v1, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 316
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v10, ".END_CALL"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 317
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v10, ".DECLINE_CALL"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 318
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v10, ".ANSWER_CALL"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 319
    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v7, v1}, Lorg/telegram/messenger/voip/VoIPService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 321
    invoke-static {}, Lorg/telegram/tgnet/ConnectionsManager;->getInstance()Lorg/telegram/tgnet/ConnectionsManager;

    move-result-object v7

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v7, v10, v11}, Lorg/telegram/tgnet/ConnectionsManager;->setAppPaused(ZZ)V

    .line 323
    new-instance v7, Landroid/media/SoundPool;

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct {v7, v10, v11, v12}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    .line 324
    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    const v10, 0x7f060003

    const/4 v11, 0x1

    invoke-virtual {v7, p0, v10, v11}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v7

    iput v7, p0, Lorg/telegram/messenger/voip/VoIPService;->spConnectingId:I

    .line 325
    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    const v10, 0x7f060006

    const/4 v11, 0x1

    invoke-virtual {v7, p0, v10, v11}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v7

    iput v7, p0, Lorg/telegram/messenger/voip/VoIPService;->spRingbackID:I

    .line 326
    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    const v10, 0x7f060005

    const/4 v11, 0x1

    invoke-virtual {v7, p0, v10, v11}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v7

    iput v7, p0, Lorg/telegram/messenger/voip/VoIPService;->spFailedID:I

    .line 327
    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    const v10, 0x7f060004

    const/4 v11, 0x1

    invoke-virtual {v7, p0, v10, v11}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v7

    iput v7, p0, Lorg/telegram/messenger/voip/VoIPService;->spEndId:I

    .line 328
    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    const v10, 0x7f060002

    const/4 v11, 0x1

    invoke-virtual {v7, p0, v10, v11}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v7

    iput v7, p0, Lorg/telegram/messenger/voip/VoIPService;->spBusyId:I

    .line 330
    new-instance v7, Landroid/content/ComponentName;

    const-class v10, Lorg/telegram/messenger/voip/VoIPMediaButtonReceiver;

    invoke-direct {v7, p0, v10}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v7}, Landroid/media/AudioManager;->registerMediaButtonEventReceiver(Landroid/content/ComponentName;)V

    .line 332
    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->btAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v7, :cond_6

    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->btAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v7}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 333
    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->btAdapter:Landroid/bluetooth/BluetoothAdapter;

    const/4 v10, 0x1

    invoke-virtual {v7, v10}, Landroid/bluetooth/BluetoothAdapter;->getProfileConnectionState(I)I

    move-result v2

    .line 334
    .local v2, "headsetState":I
    if-ne v2, v14, :cond_5

    move v7, v8

    :goto_2
    invoke-direct {p0, v7}, Lorg/telegram/messenger/voip/VoIPService;->updateBluetoothHeadsetState(Z)V

    .line 335
    if-ne v2, v14, :cond_2

    .line 336
    const/4 v7, 0x1

    invoke-virtual {v0, v7}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 337
    :cond_2
    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->stateListeners:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/telegram/messenger/voip/VoIPService$StateListener;

    .line 338
    .local v3, "l":Lorg/telegram/messenger/voip/VoIPService$StateListener;
    invoke-interface {v3}, Lorg/telegram/messenger/voip/VoIPService$StateListener;->onAudioSettingsChanged()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 342
    .end local v1    # "filter":Landroid/content/IntentFilter;
    .end local v2    # "headsetState":I
    .end local v3    # "l":Lorg/telegram/messenger/voip/VoIPService$StateListener;
    :catch_0
    move-exception v6

    .line 343
    .local v6, "x":Ljava/lang/Exception;
    const-string/jumbo v7, "error initializing voip controller"

    invoke-static {v7, v6}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 344
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->callFailed()V

    .line 346
    .end local v6    # "x":Ljava/lang/Exception;
    :goto_4
    return-void

    .line 283
    .end local v5    # "preferences":Landroid/content/SharedPreferences;
    :cond_3
    const v7, 0xbb80

    const/4 v10, 0x4

    invoke-static {v7, v10, v14}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    invoke-static {v7}, Lorg/telegram/messenger/voip/VoIPController;->setNativeBufferSize(I)V

    goto/16 :goto_0

    .line 306
    .restart local v5    # "preferences":Landroid/content/SharedPreferences;
    :cond_4
    const/4 v7, 0x0

    goto/16 :goto_1

    .restart local v1    # "filter":Landroid/content/IntentFilter;
    .restart local v2    # "headsetState":I
    :cond_5
    move v7, v9

    .line 334
    goto :goto_2

    .line 341
    .end local v2    # "headsetState":I
    :cond_6
    :try_start_1
    invoke-static {}, Lorg/telegram/messenger/NotificationCenter;->getInstance()Lorg/telegram/messenger/NotificationCenter;

    move-result-object v7

    sget v8, Lorg/telegram/messenger/NotificationCenter;->appDidLogout:I

    invoke-virtual {v7, p0, v8}, Lorg/telegram/messenger/NotificationCenter;->addObserver(Ljava/lang/Object;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4
.end method

.method public onDestroy()V
    .locals 15

    .prologue
    const/4 v14, 0x1

    const/4 v13, 0x0

    const/4 v12, 0x0

    .line 350
    const-string/jumbo v6, "=============== VoIPService STOPPING ==============="

    invoke-static {v6}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V

    .line 351
    invoke-virtual {p0, v14}, Lorg/telegram/messenger/voip/VoIPService;->stopForeground(Z)V

    .line 352
    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->stopRinging()V

    .line 353
    invoke-static {}, Lorg/telegram/messenger/NotificationCenter;->getInstance()Lorg/telegram/messenger/NotificationCenter;

    move-result-object v6

    sget v7, Lorg/telegram/messenger/NotificationCenter;->appDidLogout:I

    invoke-virtual {v6, p0, v7}, Lorg/telegram/messenger/NotificationCenter;->removeObserver(Ljava/lang/Object;I)V

    .line 354
    const-string/jumbo v6, "sensor"

    invoke-virtual {p0, v6}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/hardware/SensorManager;

    .line 355
    .local v4, "sm":Landroid/hardware/SensorManager;
    const/16 v6, 0x8

    invoke-virtual {v4, v6}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v2

    .line 356
    .local v2, "proximity":Landroid/hardware/Sensor;
    if-eqz v2, :cond_0

    .line 357
    invoke-virtual {v4, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 359
    :cond_0
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->proximityWakelock:Landroid/os/PowerManager$WakeLock;

    if-eqz v6, :cond_1

    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->proximityWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 360
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->proximityWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 362
    :cond_1
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v6}, Lorg/telegram/messenger/voip/VoIPService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 363
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    if-eqz v6, :cond_2

    .line 364
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    invoke-static {v6}, Lorg/telegram/messenger/AndroidUtilities;->cancelRunOnUIThread(Ljava/lang/Runnable;)V

    .line 365
    iput-object v13, p0, Lorg/telegram/messenger/voip/VoIPService;->timeoutRunnable:Ljava/lang/Runnable;

    .line 367
    :cond_2
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 368
    sput-object v13, Lorg/telegram/messenger/voip/VoIPService;->sharedInstance:Lorg/telegram/messenger/voip/VoIPService;

    .line 369
    new-instance v6, Lorg/telegram/messenger/voip/VoIPService$4;

    invoke-direct {v6, p0}, Lorg/telegram/messenger/voip/VoIPService$4;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    invoke-static {v6}, Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;)V

    .line 375
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    if-eqz v6, :cond_4

    iget-boolean v6, p0, Lorg/telegram/messenger/voip/VoIPService;->controllerStarted:Z

    if-eqz v6, :cond_4

    .line 376
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v6}, Lorg/telegram/messenger/voip/VoIPController;->getCallDuration()J

    move-result-wide v6

    iput-wide v6, p0, Lorg/telegram/messenger/voip/VoIPService;->lastKnownDuration:J

    .line 377
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->updateStats()V

    .line 378
    invoke-static {}, Lorg/telegram/messenger/StatsController;->getInstance()Lorg/telegram/messenger/StatsController;

    move-result-object v6

    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->getStatsNetworkType()I

    move-result v7

    iget-wide v8, p0, Lorg/telegram/messenger/voip/VoIPService;->lastKnownDuration:J

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    long-to-int v8, v8

    rem-int/lit8 v8, v8, 0x5

    invoke-virtual {v6, v7, v8}, Lorg/telegram/messenger/StatsController;->incrementTotalCallsTime(II)V

    .line 379
    iget-boolean v6, p0, Lorg/telegram/messenger/voip/VoIPService;->needSendDebugLog:Z

    if-eqz v6, :cond_3

    .line 380
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v6}, Lorg/telegram/messenger/voip/VoIPController;->getDebugLog()Ljava/lang/String;

    move-result-object v1

    .line 381
    .local v1, "debugLog":Ljava/lang/String;
    new-instance v3, Lorg/telegram/tgnet/TLRPC$TL_phone_saveCallDebug;

    invoke-direct {v3}, Lorg/telegram/tgnet/TLRPC$TL_phone_saveCallDebug;-><init>()V

    .line 382
    .local v3, "req":Lorg/telegram/tgnet/TLRPC$TL_phone_saveCallDebug;
    new-instance v6, Lorg/telegram/tgnet/TLRPC$TL_dataJSON;

    invoke-direct {v6}, Lorg/telegram/tgnet/TLRPC$TL_dataJSON;-><init>()V

    iput-object v6, v3, Lorg/telegram/tgnet/TLRPC$TL_phone_saveCallDebug;->debug:Lorg/telegram/tgnet/TLRPC$TL_dataJSON;

    .line 383
    iget-object v6, v3, Lorg/telegram/tgnet/TLRPC$TL_phone_saveCallDebug;->debug:Lorg/telegram/tgnet/TLRPC$TL_dataJSON;

    iput-object v1, v6, Lorg/telegram/tgnet/TLRPC$TL_dataJSON;->data:Ljava/lang/String;

    .line 384
    new-instance v6, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    invoke-direct {v6}, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;-><init>()V

    iput-object v6, v3, Lorg/telegram/tgnet/TLRPC$TL_phone_saveCallDebug;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    .line 385
    iget-object v6, v3, Lorg/telegram/tgnet/TLRPC$TL_phone_saveCallDebug;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v8, v7, Lorg/telegram/tgnet/TLRPC$PhoneCall;->access_hash:J

    iput-wide v8, v6, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;->access_hash:J

    .line 386
    iget-object v6, v3, Lorg/telegram/tgnet/TLRPC$TL_phone_saveCallDebug;->peer:Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;

    iget-object v7, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iget-wide v8, v7, Lorg/telegram/tgnet/TLRPC$PhoneCall;->id:J

    iput-wide v8, v6, Lorg/telegram/tgnet/TLRPC$TL_inputPhoneCall;->id:J

    .line 387
    invoke-static {}, Lorg/telegram/tgnet/ConnectionsManager;->getInstance()Lorg/telegram/tgnet/ConnectionsManager;

    move-result-object v6

    new-instance v7, Lorg/telegram/messenger/voip/VoIPService$5;

    invoke-direct {v7, p0}, Lorg/telegram/messenger/voip/VoIPService$5;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    invoke-virtual {v6, v3, v7}, Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;)I

    .line 394
    .end local v1    # "debugLog":Ljava/lang/String;
    .end local v3    # "req":Lorg/telegram/tgnet/TLRPC$TL_phone_saveCallDebug;
    :cond_3
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    invoke-virtual {v6}, Lorg/telegram/messenger/voip/VoIPController;->release()V

    .line 395
    iput-object v13, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    .line 397
    :cond_4
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->cpuWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 398
    const-string/jumbo v6, "audio"

    invoke-virtual {p0, v6}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 399
    .local v0, "am":Landroid/media/AudioManager;
    iget-boolean v6, p0, Lorg/telegram/messenger/voip/VoIPService;->isBtHeadsetConnected:Z

    if-eqz v6, :cond_5

    iget-boolean v6, p0, Lorg/telegram/messenger/voip/VoIPService;->playingSound:Z

    if-nez v6, :cond_5

    .line 400
    invoke-virtual {v0}, Landroid/media/AudioManager;->stopBluetoothSco()V

    .line 401
    invoke-virtual {v0, v12}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 404
    :cond_5
    const/4 v6, 0x0

    :try_start_0
    invoke-virtual {v0, v6}, Landroid/media/AudioManager;->setMode(I)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 408
    :goto_0
    new-instance v6, Landroid/content/ComponentName;

    const-class v7, Lorg/telegram/messenger/voip/VoIPMediaButtonReceiver;

    invoke-direct {v6, p0, v7}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v6}, Landroid/media/AudioManager;->unregisterMediaButtonEventReceiver(Landroid/content/ComponentName;)V

    .line 409
    iget-boolean v6, p0, Lorg/telegram/messenger/voip/VoIPService;->haveAudioFocus:Z

    if-eqz v6, :cond_6

    .line 410
    invoke-virtual {v0, p0}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 412
    :cond_6
    iget-boolean v6, p0, Lorg/telegram/messenger/voip/VoIPService;->playingSound:Z

    if-nez v6, :cond_7

    .line 413
    iget-object v6, p0, Lorg/telegram/messenger/voip/VoIPService;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v6}, Landroid/media/SoundPool;->release()V

    .line 415
    :cond_7
    invoke-static {}, Lorg/telegram/tgnet/ConnectionsManager;->getInstance()Lorg/telegram/tgnet/ConnectionsManager;

    move-result-object v6

    invoke-virtual {v6, v14, v12}, Lorg/telegram/tgnet/ConnectionsManager;->setAppPaused(ZZ)V

    .line 416
    return-void

    .line 405
    :catch_0
    move-exception v5

    .line 406
    .local v5, "x":Ljava/lang/SecurityException;
    const-string/jumbo v6, "Error setting audio more to normal"

    invoke-static {v6, v5}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method onMediaButtonEvent(Landroid/view/KeyEvent;)V
    .locals 4
    .param p1, "ev"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x1

    .line 1533
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    const/16 v3, 0x4f

    if-ne v2, v3, :cond_0

    .line 1534
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    if-ne v2, v1, :cond_0

    .line 1535
    iget v2, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    const/16 v3, 0xf

    if-ne v2, v3, :cond_1

    .line 1536
    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->acceptIncomingCall()V

    .line 1544
    :cond_0
    return-void

    .line 1538
    :cond_1
    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->isMicMute()Z

    move-result v2

    if-nez v2, :cond_2

    :goto_0
    invoke-virtual {p0, v1}, Lorg/telegram/messenger/voip/VoIPService;->setMicMute(Z)V

    .line 1539
    iget-object v1, p0, Lorg/telegram/messenger/voip/VoIPService;->stateListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/telegram/messenger/voip/VoIPService$StateListener;

    .line 1540
    .local v0, "l":Lorg/telegram/messenger/voip/VoIPService$StateListener;
    invoke-interface {v0}, Lorg/telegram/messenger/voip/VoIPService$StateListener;->onAudioSettingsChanged()V

    goto :goto_1

    .line 1538
    .end local v0    # "l":Lorg/telegram/messenger/voip/VoIPService$StateListener;
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 7
    .param p1, "event"    # Landroid/hardware/SensorEvent;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 1377
    iget-object v4, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v4}, Landroid/hardware/Sensor;->getType()I

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_0

    .line 1378
    const-string/jumbo v4, "audio"

    invoke-virtual {p0, v4}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 1379
    .local v0, "am":Landroid/media/AudioManager;
    iget-boolean v4, p0, Lorg/telegram/messenger/voip/VoIPService;->isHeadsetPlugged:Z

    if-nez v4, :cond_0

    invoke-virtual {v0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->isBluetoothHeadsetConnected()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1397
    .end local v0    # "am":Landroid/media/AudioManager;
    :cond_0
    :goto_0
    return-void

    .line 1382
    .restart local v0    # "am":Landroid/media/AudioManager;
    :cond_1
    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v3

    iget-object v5, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v5}, Landroid/hardware/Sensor;->getMaximumRange()F

    move-result v5

    const/high16 v6, 0x40400000    # 3.0f

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v5

    cmpg-float v4, v4, v5

    if-gez v4, :cond_2

    .line 1383
    .local v1, "newIsNear":Z
    :goto_1
    iget-boolean v3, p0, Lorg/telegram/messenger/voip/VoIPService;->isProximityNear:Z

    if-eq v1, v3, :cond_0

    .line 1384
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "proximity "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/telegram/messenger/FileLog;->d(Ljava/lang/String;)V

    .line 1385
    iput-boolean v1, p0, Lorg/telegram/messenger/voip/VoIPService;->isProximityNear:Z

    .line 1387
    :try_start_0
    iget-boolean v3, p0, Lorg/telegram/messenger/voip/VoIPService;->isProximityNear:Z

    if-eqz v3, :cond_3

    .line 1388
    iget-object v3, p0, Lorg/telegram/messenger/voip/VoIPService;->proximityWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v3}, Landroid/os/PowerManager$WakeLock;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1392
    :catch_0
    move-exception v2

    .line 1393
    .local v2, "x":Ljava/lang/Exception;
    invoke-static {v2}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/Throwable;)V

    goto :goto_0

    .end local v1    # "newIsNear":Z
    .end local v2    # "x":Ljava/lang/Exception;
    :cond_2
    move v1, v3

    .line 1382
    goto :goto_1

    .line 1390
    .restart local v1    # "newIsNear":Z
    :cond_3
    :try_start_1
    iget-object v3, p0, Lorg/telegram/messenger/voip/VoIPService;->proximityWakelock:Landroid/os/PowerManager$WakeLock;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/os/PowerManager$WakeLock;->release(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x0

    .line 243
    sget-object v0, Lorg/telegram/messenger/voip/VoIPService;->sharedInstance:Lorg/telegram/messenger/voip/VoIPService;

    if-eqz v0, :cond_0

    .line 244
    const-string/jumbo v0, "Tried to start the VoIP service when it\'s already started"

    invoke-static {v0}, Lorg/telegram/messenger/FileLog;->e(Ljava/lang/String;)V

    .line 271
    :goto_0
    return v3

    .line 247
    :cond_0
    const-string/jumbo v0, "user_id"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/telegram/messenger/voip/VoIPService;->userID:I

    .line 248
    const-string/jumbo v0, "is_outgoing"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->isOutgoing:Z

    .line 249
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget v1, p0, Lorg/telegram/messenger/voip/VoIPService;->userID:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/telegram/messenger/MessagesController;->getUser(Ljava/lang/Integer;)Lorg/telegram/tgnet/TLRPC$User;

    move-result-object v0

    iput-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    .line 251
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->user:Lorg/telegram/tgnet/TLRPC$User;

    if-nez v0, :cond_1

    .line 252
    const-string/jumbo v0, "VoIPService: user==null"

    invoke-static {v0}, Lorg/telegram/messenger/FileLog;->w(Ljava/lang/String;)V

    .line 253
    invoke-virtual {p0}, Lorg/telegram/messenger/voip/VoIPService;->stopSelf()V

    goto :goto_0

    .line 257
    :cond_1
    iget-boolean v0, p0, Lorg/telegram/messenger/voip/VoIPService;->isOutgoing:Z

    if-eqz v0, :cond_3

    .line 258
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->startOutgoingCall()V

    .line 259
    const-string/jumbo v0, "start_incall_activity"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 260
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/telegram/ui/VoIPActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/telegram/messenger/voip/VoIPService;->startActivity(Landroid/content/Intent;)V

    .line 268
    :cond_2
    :goto_1
    sput-object p0, Lorg/telegram/messenger/voip/VoIPService;->sharedInstance:Lorg/telegram/messenger/voip/VoIPService;

    goto :goto_0

    .line 263
    :cond_3
    invoke-static {}, Lorg/telegram/messenger/NotificationCenter;->getInstance()Lorg/telegram/messenger/NotificationCenter;

    move-result-object v0

    sget v1, Lorg/telegram/messenger/NotificationCenter;->closeInCallActivity:I

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lorg/telegram/messenger/NotificationCenter;->postNotificationName(I[Ljava/lang/Object;)V

    .line 264
    sget-object v0, Lorg/telegram/messenger/voip/VoIPService;->callIShouldHavePutIntoIntent:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    iput-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->call:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    .line 265
    const/4 v0, 0x0

    sput-object v0, Lorg/telegram/messenger/voip/VoIPService;->callIShouldHavePutIntoIntent:Lorg/telegram/tgnet/TLRPC$PhoneCall;

    .line 266
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->acknowledgeCallAndStartRinging()V

    goto :goto_1
.end method

.method public onUIForegroundStateChanged(Z)V
    .locals 4
    .param p1, "isForeground"    # Z

    .prologue
    .line 1508
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    const/16 v1, 0xf

    if-ne v0, v1, :cond_0

    .line 1509
    if-eqz p1, :cond_1

    .line 1510
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/telegram/messenger/voip/VoIPService;->stopForeground(Z)V

    .line 1530
    :cond_0
    :goto_0
    return-void

    .line 1512
    :cond_1
    const-string/jumbo v0, "keyguard"

    invoke-virtual {p0, v0}, Lorg/telegram/messenger/voip/VoIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1513
    invoke-direct {p0}, Lorg/telegram/messenger/voip/VoIPService;->showIncomingNotification()V

    goto :goto_0

    .line 1515
    :cond_2
    new-instance v0, Lorg/telegram/messenger/voip/VoIPService$20;

    invoke-direct {v0, p0}, Lorg/telegram/messenger/voip/VoIPService$20;-><init>(Lorg/telegram/messenger/voip/VoIPService;)V

    const-wide/16 v2, 0x1f4

    invoke-static {v0, v2, v3}, Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;J)V

    goto :goto_0
.end method

.method public registerStateListener(Lorg/telegram/messenger/voip/VoIPService$StateListener;)V
    .locals 1
    .param p1, "l"    # Lorg/telegram/messenger/voip/VoIPService$StateListener;

    .prologue
    .line 453
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->stateListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 454
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    if-eqz v0, :cond_0

    .line 455
    iget v0, p0, Lorg/telegram/messenger/voip/VoIPService;->currentState:I

    invoke-interface {p1, v0}, Lorg/telegram/messenger/voip/VoIPService$StateListener;->onStateChanged(I)V

    .line 456
    :cond_0
    return-void
.end method

.method public setMicMute(Z)V
    .locals 1
    .param p1, "mute"    # Z

    .prologue
    .line 427
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->controller:Lorg/telegram/messenger/voip/VoIPController;

    iput-boolean p1, p0, Lorg/telegram/messenger/voip/VoIPService;->micMute:Z

    invoke-virtual {v0, p1}, Lorg/telegram/messenger/voip/VoIPController;->setMicMute(Z)V

    .line 428
    return-void
.end method

.method public stopRinging()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 993
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 994
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 995
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 996
    iput-object v1, p0, Lorg/telegram/messenger/voip/VoIPService;->ringtonePlayer:Landroid/media/MediaPlayer;

    .line 998
    :cond_0
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->vibrator:Landroid/os/Vibrator;

    if-eqz v0, :cond_1

    .line 999
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->vibrator:Landroid/os/Vibrator;

    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    .line 1000
    iput-object v1, p0, Lorg/telegram/messenger/voip/VoIPService;->vibrator:Landroid/os/Vibrator;

    .line 1002
    :cond_1
    return-void
.end method

.method public unregisterStateListener(Lorg/telegram/messenger/voip/VoIPService$StateListener;)V
    .locals 1
    .param p1, "l"    # Lorg/telegram/messenger/voip/VoIPService$StateListener;

    .prologue
    .line 459
    iget-object v0, p0, Lorg/telegram/messenger/voip/VoIPService;->stateListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 460
    return-void
.end method
