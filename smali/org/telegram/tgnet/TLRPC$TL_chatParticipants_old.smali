.class public Lorg/telegram/tgnet/TLRPC$TL_chatParticipants_old;
.super Lorg/telegram/tgnet/TLRPC$TL_chatParticipants;
.source "TLRPC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/telegram/tgnet/TLRPC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TL_chatParticipants_old"
.end annotation


# static fields
.field public static constructor:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17494
    const v0, 0x7841b415

    sput v0, Lorg/telegram/tgnet/TLRPC$TL_chatParticipants_old;->constructor:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17493
    invoke-direct {p0}, Lorg/telegram/tgnet/TLRPC$TL_chatParticipants;-><init>()V

    return-void
.end method


# virtual methods
.method public readParams(Lorg/telegram/tgnet/AbstractSerializedData;Z)V
    .locals 9
    .param p1, "stream"    # Lorg/telegram/tgnet/AbstractSerializedData;
    .param p2, "exception"    # Z

    .prologue
    .line 17498
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v4

    iput v4, p0, Lorg/telegram/tgnet/TLRPC$TL_chatParticipants_old;->chat_id:I

    .line 17499
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v4

    iput v4, p0, Lorg/telegram/tgnet/TLRPC$TL_chatParticipants_old;->admin_id:I

    .line 17500
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v2

    .line 17501
    .local v2, "magic":I
    const v4, 0x1cb5c415

    if-eq v2, v4, :cond_0

    .line 17502
    if-eqz p2, :cond_1

    .line 17503
    new-instance v4, Ljava/lang/RuntimeException;

    const-string/jumbo v5, "wrong Vector magic, got %x"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 17507
    :cond_0
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v1

    .line 17508
    .local v1, "count":I
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_0
    if-ge v0, v1, :cond_3

    .line 17509
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v4

    invoke-static {p1, v4, p2}, Lorg/telegram/tgnet/TLRPC$ChatParticipant;->TLdeserialize(Lorg/telegram/tgnet/AbstractSerializedData;IZ)Lorg/telegram/tgnet/TLRPC$ChatParticipant;

    move-result-object v3

    .line 17510
    .local v3, "object":Lorg/telegram/tgnet/TLRPC$ChatParticipant;
    if-nez v3, :cond_2

    .line 17516
    .end local v0    # "a":I
    .end local v1    # "count":I
    .end local v3    # "object":Lorg/telegram/tgnet/TLRPC$ChatParticipant;
    :cond_1
    :goto_1
    return-void

    .line 17513
    .restart local v0    # "a":I
    .restart local v1    # "count":I
    .restart local v3    # "object":Lorg/telegram/tgnet/TLRPC$ChatParticipant;
    :cond_2
    iget-object v4, p0, Lorg/telegram/tgnet/TLRPC$TL_chatParticipants_old;->participants:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17508
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 17515
    .end local v3    # "object":Lorg/telegram/tgnet/TLRPC$ChatParticipant;
    :cond_3
    invoke-virtual {p1, p2}, Lorg/telegram/tgnet/AbstractSerializedData;->readInt32(Z)I

    move-result v4

    iput v4, p0, Lorg/telegram/tgnet/TLRPC$TL_chatParticipants_old;->version:I

    goto :goto_1
.end method

.method public serializeToStream(Lorg/telegram/tgnet/AbstractSerializedData;)V
    .locals 3
    .param p1, "stream"    # Lorg/telegram/tgnet/AbstractSerializedData;

    .prologue
    .line 17519
    sget v2, Lorg/telegram/tgnet/TLRPC$TL_chatParticipants_old;->constructor:I

    invoke-virtual {p1, v2}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 17520
    iget v2, p0, Lorg/telegram/tgnet/TLRPC$TL_chatParticipants_old;->chat_id:I

    invoke-virtual {p1, v2}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 17521
    iget v2, p0, Lorg/telegram/tgnet/TLRPC$TL_chatParticipants_old;->admin_id:I

    invoke-virtual {p1, v2}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 17522
    const v2, 0x1cb5c415

    invoke-virtual {p1, v2}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 17523
    iget-object v2, p0, Lorg/telegram/tgnet/TLRPC$TL_chatParticipants_old;->participants:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 17524
    .local v1, "count":I
    invoke-virtual {p1, v1}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 17525
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 17526
    iget-object v2, p0, Lorg/telegram/tgnet/TLRPC$TL_chatParticipants_old;->participants:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/telegram/tgnet/TLRPC$ChatParticipant;

    invoke-virtual {v2, p1}, Lorg/telegram/tgnet/TLRPC$ChatParticipant;->serializeToStream(Lorg/telegram/tgnet/AbstractSerializedData;)V

    .line 17525
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 17528
    :cond_0
    iget v2, p0, Lorg/telegram/tgnet/TLRPC$TL_chatParticipants_old;->version:I

    invoke-virtual {p1, v2}, Lorg/telegram/tgnet/AbstractSerializedData;->writeInt32(I)V

    .line 17529
    return-void
.end method
