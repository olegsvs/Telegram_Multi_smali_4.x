.class public Lorg/telegram/tgnet/TLRPC$TL_decryptedMessageService_layer8;
.super Lorg/telegram/tgnet/TLRPC$TL_decryptedMessageService;
.source "TLRPC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/telegram/tgnet/TLRPC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TL_decryptedMessageService_layer8"
.end annotation


# static fields
.field public static constructor:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9681
    const v0, -0x55b7cd83

    sput v0, Lorg/telegram/tgnet/TLRPC$TL_decryptedMessageService_layer8;->constructor:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9680
    invoke-direct {p0}, Lorg/telegram/tgnet/TLRPC$TL_decryptedMessageService;-><init>()V

    return-void
.end method


# virtual methods
.method public readParams(Lorg/telegram/tgnet/AbstractSerializedData;Z)V
    .locals 2
    .param p1, "stream"    # Lorg/telegram/tgnet/AbstractSerializedData;
    .param p2, "exception"    # Z

    .prologue
    .line 9685
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt64(Z)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/telegram/tgnet/TLRPC$TL_decryptedMessageService_layer8;->random_id:J

    .line 9686
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readByteArray(Z)[B

    move-result-object v0

    iput-object v0, p0, Lorg/telegram/tgnet/TLRPC$TL_decryptedMessageService_layer8;->random_bytes:[B

    .line 9687
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v0

    invoke-static {p1, v0, p2}, Lorg/telegram/tgnet/TLRPC$DecryptedMessageAction;->TLdeserialize(Lorg/telegram/tgnet/AbstractSerializedData;IZ)Lorg/telegram/tgnet/TLRPC$DecryptedMessageAction;

    move-result-object v0

    iput-object v0, p0, Lorg/telegram/tgnet/TLRPC$TL_decryptedMessageService_layer8;->action:Lorg/telegram/tgnet/TLRPC$DecryptedMessageAction;

    .line 9688
    return-void
.end method

.method public serializeToStream(Lorg/telegram/tgnet/AbstractSerializedData;)V
    .locals 2
    .param p1, "stream"    # Lorg/telegram/tgnet/AbstractSerializedData;

    .prologue
    .line 9691
    sget v0, Lorg/telegram/tgnet/TLRPC$TL_decryptedMessageService_layer8;->constructor:I

    invoke-virtual {p1, v0}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 9692
    iget-wide v0, p0, Lorg/telegram/tgnet/TLRPC$TL_decryptedMessageService_layer8;->random_id:J

    invoke-virtual {p1, v0, v1}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt64(J)V

    .line 9693
    iget-object v0, p0, Lorg/telegram/tgnet/TLRPC$TL_decryptedMessageService_layer8;->random_bytes:[B

    invoke-virtual {p1, v0}, Lorg/telegram/tgnet/AbstractSerializedData;->writeByteArray([B)V

    .line 9694
    iget-object v0, p0, Lorg/telegram/tgnet/TLRPC$TL_decryptedMessageService_layer8;->action:Lorg/telegram/tgnet/TLRPC$DecryptedMessageAction;

    invoke-virtual {v0, p1}, Lorg/telegram/tgnet/TLRPC$DecryptedMessageAction;->serializeToStream(Lorg/telegram/tgnet/AbstractSerializedData;)V

    .line 9695
    return-void
.end method
